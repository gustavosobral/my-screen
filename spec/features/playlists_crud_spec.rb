feature 'As an User I manage Playlist CRUD', type: :feature do
  scenario 'destroying' do
    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist, user: user)

    sign_in user
    visit panel_playlists_path
    expect(page).to have_content playlist.title

    # Destroy
    expect { click_link 'Excluir' }.to change(Playlist, :count).by(-1)
  end
end
