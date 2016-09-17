feature 'I manage my profile', type: :feature do
  context 'As an regular user' do
    let(:user) { FactoryGirl.create(:user) }

    scenario 'updating attributes' do
      sign_in user
      visit panel_root_path
      expect(page).to have_content user.name
      click_link user.name
      fill_in 'user_name', with: 'Novo Nome'
      submit_form
      expect(page).to have_content 'Novo Nome'
    end

    scenario 'do automatic logout after change password' do
      sign_in user
      visit panel_root_path
      click_link user.name
      fill_in 'user_password', with: 'newpassword'
      fill_in 'user_password_confirmation', with: 'newpassword'
      submit_form

      expect(current_path).to eq(user_session_path)
      expect(page).to have_content 'Senha'
    end
  end

  context 'As an admin user' do
    let(:admin_user) { FactoryGirl.create(:admin_user) }

    scenario 'updating attributes' do
      sign_in admin_user
      visit admin_root_path
      expect(page).to have_content admin_user.name
      click_link admin_user.name
      fill_in 'user_name', with: 'Novo Admin Nome'
      submit_form
      expect(page).to have_content 'Novo Admin Nome'
    end
  end
end
