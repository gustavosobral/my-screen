feature 'As an admin I manage User CRUD', type: :feature do
  let(:user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.create(:admin_user) }

  context 'with invalid data' do
    scenario 'show errors' do
      sign_in admin_user
      visit admin_users_path
      expect(page).to have_no_content user.name

      # Blank name and e-mail
      visit new_admin_user_path
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      submit_form
      expect(page).to have_content 'Nome não pode ficar em branco'
      expect(page).to have_content 'E-mail não pode ficar em branco'

      # Short password validation and confirmation mismatch
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '123'
      fill_in 'user_password_confirmation', with: 'different'
      submit_form
      expect(page).to have_content 'Senha é muito curto'
      expect(page).to have_content 'Confirmação de senha não está de acordo'
    end
  end

  context 'with valid data' do
    scenario 'create and destroy' do
      sign_in admin_user
      visit new_admin_user_path

      # Create
      fill_in 'user_name', with: user.name
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      submit_form
      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content user.name
      expect(page).to have_content 'Não acessou o sistema'

      # Destroy
      expect { click_link 'Excluir' }.to change(User, :count).by(-1)
    end

    scenario 'update without password' do
      user.save
      user.reload
      sign_in admin_user

      # Update
      visit admin_users_path
      expect(page).to have_content user.name
      visit edit_admin_user_path(user)
      fill_in 'user_name', with: 'Jonas'
      submit_form
      expect(page).to have_content 'Jonas'
    end
  end
end
