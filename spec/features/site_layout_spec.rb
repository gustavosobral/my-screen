feature 'Public site layout', type: :feature do
  scenario 'layout links' do
    visit root_path
    expect(page).to have_content 'MyScreen'
    expect(page).to have_link 'Sobre'
    expect(page).to have_link 'Login'
    expect(page).to have_link 'Saiba mais'
  end

  scenario 'layout links with login in' do
    user = FactoryGirl.create(:user)
    admin_user = FactoryGirl.create(:admin_user)

    visit root_path
    expect(page).to have_link 'Login'

    sign_in user
    visit root_path
    expect(page).to have_link 'Painel'
    click_link 'Painel'
    find('#exit').click
    expect(page).to have_no_link 'Painel'

    sign_in admin_user
    visit root_path
    expect(page).to have_link 'Painel Admin'
    click_link 'Admin'
    find('#exit').click
    expect(page).to have_no_link 'Painel Admin'
  end

  scenario 'login page' do
    visit root_path
    expect(page).to have_link 'Login'

    click_link 'Login'
    expect(page).to have_content 'E-mail'
    expect(page).to have_content 'Senha'
    expect(page).to have_css '#root'

    find('#root').click
    expect(page).to have_content 'MyScreen'
  end
end
