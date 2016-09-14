describe 'Resources authenticated access', type: :request do
  context 'without login' do
    it 'denies access to panel home' do
      get panel_root_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'denies access to admin home' do
      get admin_root_path
      expect(response).to redirect_to new_user_session_path
    end

    it 'denies access to panel images' do
      get panel_images_path
      expect(response).to redirect_to new_user_session_path
    end
  end

  context 'with basic user login' do
    let(:user) { FactoryGirl.create(:user) }

    it 'allow access to panel home' do
      sign_in user
      get panel_root_path
      expect(response.status).to eq(200)
    end

    it 'allow access to panel images' do
      sign_in user
      get panel_images_path
      expect(response.status).to eq(200)
    end

    it 'denies access to admin home' do
      sign_in user
      get admin_root_path
      expect(response).to redirect_to root_path
    end
  end

  context 'with admin login' do
    let(:admin) { FactoryGirl.create(:admin_user) }

    it 'denies access to panel home' do
      sign_in admin
      get panel_root_path
      expect(response).to redirect_to root_path
    end

    it 'denies access to panel images' do
      sign_in admin
      get panel_images_path
      expect(response).to redirect_to root_path
    end

    it 'allow access to admin home' do
      sign_in admin
      get admin_root_path
      expect(response.status).to eq(200)
    end
  end
end
