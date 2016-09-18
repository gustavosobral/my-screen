feature 'As an User I manage Image CRUD', type: :feature do
  scenario 'creating, updating and destroying' do
    user = FactoryGirl.create(:user)
    image = FactoryGirl.build(:image)

    sign_in user
    visit panel_images_path
    expect(page).to have_no_content image.title

    # Submit invalid
    click_link 'Nova imagem'
    fill_in 'image_title', with: image.title
    submit_form
    expect(page).to have_content 'Descrição não pode ficar em branco'
    expect(page).to have_content 'Arquivo não pode ficar em branco'

    # Create
    fill_in 'image_title', with: image.title
    fill_in 'image_description', with: image.description
    attach_file('image_file', File.join(Rails.root, 'spec', 'fixtures', 'PbPYzVD.jpg'))
    submit_form
    expect(current_path).to eq(panel_images_path)
    expect(page).to have_content image.title

    # Update
    visit edit_panel_image_path(1)
    fill_in 'image_title', with: 'New image title'
    submit_form
    expect(page).to have_content 'New image title'

    # Destroy
    expect { click_link 'Excluir' }.to change(Image, :count).by(-1)
  end
end
