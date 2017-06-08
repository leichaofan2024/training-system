class CreateTrainingSwitchShips < ActiveRecord::Migration[5.0]
  def change
    create_table :training_switch_ships do |t|
      t.integer :training_light_id
      t.integer :training_switch_id
      t.timestamps
    end
  end
end
