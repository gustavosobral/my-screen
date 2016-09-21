feature 'I switch user', type: :feature do
  let(:admin_user) { FactoryGirl.create(:admin_user) }

  scenario 'As an admin user' do
    user = FactoryGirl.create(:user)
    sign_in admin_user
    visit admin_users_path

    # Switch user
    find("form[action='#{switch_user_path(user)}']").click_button
    expect(page).to have_content "Você está visualizando o painel como #{user.name} (#{user.email})."
    expect(page).to have_content user.name

    # Switch back
    click_button "Voltar para #{admin_user.name}"
    expect(page).to have_content 'Você voltou ao painel administrativo.'
    expect(page).to have_content admin_user.name
  end
end
