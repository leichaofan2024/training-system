class AddSceneIdToLight < ActiveRecord::Migration[5.0]
  def change
    add_column :lights, :scene_id, :integer
  end
end
