feature 'Image interface manipulation', type: :feature do
  scenario 'create, update and destroy' do
    user = FactoryGirl.create(:user)
    image = FactoryGirl.build(:image)

    sign_in user
    visit panel_images_path
    expect(page).to have_no_content image.title

    # Create
    visit new_panel_image_path
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
