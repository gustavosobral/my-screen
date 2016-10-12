class AddNotifiedToTerminal < ActiveRecord::Migration
  def change
    add_column :terminals, :notified, :boolean, default: false
  end
end
