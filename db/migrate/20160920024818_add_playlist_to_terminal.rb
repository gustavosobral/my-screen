class AddPlaylistToTerminal < ActiveRecord::Migration
  def change
    add_reference :terminals, :playlist, index: true, foreign_key: true
  end
end
