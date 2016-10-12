class AddNotifiedToTerminal < ActiveRecord::Migration
  def change
    add_column :terminals, :notified, :boolean, default: true
  end
end
