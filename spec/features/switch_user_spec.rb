feature 'I switch user', type: :feature do
  let(:admin_user) { FactoryGirl.create(:admin_user) }

  scenario 'As an admin user' do
    user = FactoryGirl.create(:user)
    sign_in admin_user
    visit admin_users_path

    # Switch user
    expect(page).to have_link(nil, href: switch_user_path(user))
    click_link_by_href switch_user_path(user)
    expect(page).to have_content "Você está visualizando o painel como #{user.name}."
    expect(page).to have_content user.name

    # Switch back
    expect(page).to have_link "Voltar para #{admin_user.name}"
    click_link "Voltar para #{admin_user.name}"
    expect(page).to have_content 'Você voltou ao painel administrativo.'
    expect(page).to have_content admin_user.name
  end
end
