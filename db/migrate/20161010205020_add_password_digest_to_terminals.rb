class AddPasswordDigestToTerminals < ActiveRecord::Migration
  def change
    add_column :terminals, :password_digest, :string
  end
end
