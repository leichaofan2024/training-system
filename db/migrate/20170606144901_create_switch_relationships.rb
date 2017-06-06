class CreateSwitchRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :switch_relationships do |t|
      t.integer :switch_id
      t.integer :light_id

      t.timestamps
    end
  end
end
