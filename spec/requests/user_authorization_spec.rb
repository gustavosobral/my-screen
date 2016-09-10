describe 'Resources authorization access', type: :request do
  before(:context) do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user, email: 'teste@email.com')
  end


  context 'with other user image' do
    before(:context) do
      @image_attributes = FactoryGirl.attributes_for(:image)

      sign_in @other_user
      post panel_images_path, { image: @image_attributes }
      sign_out @other_user
    end

    it 'not update' do
      sign_in @user
      patch panel_image_path(1), { image: @image_attributes }
      expect(response).to redirect_to panel_root_path
    end


    it 'not destroy' do
      sign_in @user
      delete panel_image_path(1)
      expect(response).to redirect_to panel_root_path
    end
  end

  context 'with other user video' do
    before(:context) do
      @video_attributes = FactoryGirl.attributes_for(:video)

      sign_in @other_user
      post panel_videos_path, { video: @video_attributes }
      sign_out @other_user
    end

    it 'not update' do
      sign_in @user
      patch panel_video_path(1), { video: @video_attributes }
      expect(response).to redirect_to panel_root_path
    end


    it 'not destroy' do
      sign_in @user
      delete panel_video_path(1)
      expect(response).to redirect_to panel_root_path
    end
  end
end
