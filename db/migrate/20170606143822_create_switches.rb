class CreateSwitches < ActiveRecord::Migration[5.0]
  def change
    create_table :switches do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
