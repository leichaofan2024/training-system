class CreateTrainingLights < ActiveRecord::Migration[5.0]
  def change
    create_table :training_lights do |t|
      t.boolean :is_on, default: false
      t.integer :training_id
      t.integer :light_id 
      t.timestamps
    end
  end
end
