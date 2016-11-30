describe 'Terminal authentication', type: :request do
  let(:terminal) { FactoryGirl.create(:terminal, password: '12345678') }

  context 'without token' do
    it 'gives forbidden' do
      headers = { 'Content-Type' => 'application/json' }
      post api_v1_login_path, "{ \"title\": \"#{terminal.title}\" , \"password\": \"#{terminal.password}\" }", headers
      expect(response).to have_http_status(:forbidden)
      expect(JSON.parse(response.body)['message']).to include("não pode realizar essa ação")
    end
  end

  context 'with valid data' do
    before(:each) do
      headers = { 'Content-Type' => 'application/json', 'X-Api-Token' => ENV['API_TOKEN'] }
      post api_v1_login_path, "{ \"title\": \"#{terminal.title}\" , \"password\": \"#{terminal.password}\" }", headers
    end

    it 'do login' do
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['token']).not_to be nil
    end

    it 'do logout' do
      terminal_token = JSON.parse(response.body)['token']
      headers = { 'Content-Type' => 'application/json',
                  'X-Api-Token' => ENV['API_TOKEN'],
                  'X-Terminal-Token' => terminal_token }
      get api_v1_logout_path, '', headers
      expect(response).to have_http_status(:ok)
    end
  end

  context 'without valid data' do
    it "don't login" do
      headers = { 'Content-Type' => 'application/json', 'X-Api-Token' => ENV['API_TOKEN'] }
      post api_v1_login_path, "{ \"title\": \"#{terminal.title}\" , \"password\": \"invalid\" }", headers
      expect(response).to have_http_status(:bad_request)
    end
  end
end
