class CreateLights < ActiveRecord::Migration[5.0]
  def change
    create_table :lights do |t|
      t.string :title
      t.boolean :is_on, default: false
      t.text :description 
      t.timestamps
    end
  end
end
