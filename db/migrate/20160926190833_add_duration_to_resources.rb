class AddDurationToResources < ActiveRecord::Migration
  def change
    add_column :resources, :duration, :float
  end
end
