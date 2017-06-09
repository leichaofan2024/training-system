class AddDescriptionToScene < ActiveRecord::Migration[5.0]
  def change
    add_column :scenes, :description, :text 
  end
end
