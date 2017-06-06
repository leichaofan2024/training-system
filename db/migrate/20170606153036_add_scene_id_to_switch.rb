class AddSceneIdToSwitch < ActiveRecord::Migration[5.0]
  def change
    add_column :switches, :scene_id, :integer
  end
end
