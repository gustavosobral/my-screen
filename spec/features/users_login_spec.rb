feature 'Site user login', type: :feature do
  scenario 'login with invalid information' do
    visit new_user_session_path
    fill_in 'user_email', with: 'invalid@invalid.com'
    fill_in 'user_password', with: '1234567'
    submit_form
    expect(page).to have_content 'E-mail ou senha inválidos.'
  end

  scenario 'login with valid information followed by logout' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Login'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    submit_form
    expect(page).to have_content 'Login efetuado com sucesso!'
    expect(page).to have_content user.name.truncate(20)
    expect(page).to have_content 'Biblioteca'

    find('#exit').click
    # Verify home screen
    expect(page).to have_content 'Saiu com sucesso.'
    expect(page).to have_content 'MyScreen'
  end

  scenario 'login with valid admin information' do
    admin_user = FactoryGirl.create(:admin_user)

    visit new_user_session_path
    fill_in 'user_email', with: admin_user.email
    fill_in 'user_password', with: admin_user.password
    submit_form
    expect(page).to have_content 'Login efetuado com sucesso!'
    expect(page).to have_content admin_user.name.truncate(20)
    # Verify admin panel
    expect(page).to have_content 'Terminais'
    expect(page).to have_content 'Usuários'
  end
end
