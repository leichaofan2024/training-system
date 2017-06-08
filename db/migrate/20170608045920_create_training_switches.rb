class CreateTrainingSwitches < ActiveRecord::Migration[5.0]
  def change
    create_table :training_switches do |t|
      t.boolean :is_on, default: false
      t.integer :training_id
      t.integer :switch_id
      t.timestamps
    end
  end
end
