class CreateAccessKeys < ActiveRecord::Migration
  def change
    create_table :access_keys do |t|
      t.string :access_token
      t.boolean :expired, default: false
      t.references :terminal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
