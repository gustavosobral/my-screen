class AddCountersToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :terminals_count, :integer
    add_column :playlists, :playlist_items_count, :integer
  end
end
