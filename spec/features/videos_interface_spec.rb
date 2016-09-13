feature 'Video interface manipulation', type: :feature do
  scenario 'create, update and destroy' do
    user = FactoryGirl.create(:user)
    video = FactoryGirl.build(:video)

    sign_in user
    visit panel_videos_path
    expect(page).to have_no_content video.title

    # Create
    visit new_panel_video_path
    fill_in 'video_title', with: video.title
    fill_in 'video_description', with: video.description
    attach_file('video_file', File.join(Rails.root, 'spec', 'fixtures', 'SampleVideo_1280x720_1mb.mp4'))
    submit_form
    expect(current_path).to eq(panel_videos_path)
    expect(page).to have_content video.title

    # Update
    visit edit_panel_video_path(1)
    fill_in 'video_title', with: 'New video title'
    submit_form
    expect(page).to have_content 'New video title'

    # Destroy
    expect { click_link 'Excluir' }.to change(Video, :count).by(-1)
  end
end
