class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :description
      t.float :duration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
