require "rails_helper"

describe 'Resources authorization access', type: :request do
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
    it 'allow access to panel home' do
      user = FactoryGirl.create(:user)
      sign_in user
      get panel_root_path
      expect(response.status).to eq(200)
    end

    it 'denies access to admin home' do
      user = FactoryGirl.create(:user)
      sign_in user
      get admin_root_path
      expect(response).to redirect_to panel_root_path
    end
  end

  context 'with admin login' do
    it 'denies access to panel home' do
      admin = FactoryGirl.create(:admin_user)
      sign_in admin
      get panel_root_path
      expect(response).to redirect_to admin_root_path
    end

    it 'allow access to admin home' do
      admin = FactoryGirl.create(:admin_user)
      sign_in admin
      get admin_root_path
      expect(response.status).to eq(200)
    end
  end
end
