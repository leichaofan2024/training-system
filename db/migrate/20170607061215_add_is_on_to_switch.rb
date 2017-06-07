class AddIsOnToSwitch < ActiveRecord::Migration[5.0]
  def change
    add_column :switches, :is_on, :boolean, default: false 
  end
end
