feature 'I manage Terminal', type: :feature do
  let(:user) { FactoryGirl.create(:user) }

  context 'as an admin user' do
    let(:admin_user) { FactoryGirl.create(:admin_user) }

    scenario 'creating, updating and destroying' do
      sign_in admin_user
      visit admin_terminals_path
      expect(page).to have_no_content user.email

      # Submit invalid
      click_link 'Novo terminal'
      submit_form
      expect(page).to have_content 'Título não pode ficar em branco'

      # Create
      fill_in 'terminal_title', with: 'my-screen-01'
      find('#terminal_user_id').find(:xpath, "option[@value='#{user.id}']").select_option
      submit_form
      expect(page).to have_content user.email
      expect(page).to have_content 'my-screen-01'

      # Update
      click_link 'Editar'
      fill_in 'terminal_title', with: 'my-screen-02'
      submit_form
      expect(page).to have_content 'my-screen-02'

      # Destroy
      expect { click_link 'Excluir' }.to change(Terminal, :count).by(-1)
    end
  end

  context 'as an regular user' do
    let(:terminal) { FactoryGirl.build(:terminal) }

    scenario 'updating attributes' do
      terminal.user = user
      terminal.save

      sign_in user
      visit panel_terminals_path
      expect(page).to have_content terminal.title

      # Update
      visit edit_panel_terminal_path(terminal)
      fill_in 'terminal_title', with: 'my-new-title'
      submit_form
      expect(page).to have_content 'my-new-title'
    end
  end
end
