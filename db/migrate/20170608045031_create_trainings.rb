class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.integer :scene_id

      t.timestamps
    end
  end
end
