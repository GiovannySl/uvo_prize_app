class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.integer :number
      t.integer :after_num
      t.string :condition_type
      t.boolean :active

      t.timestamps
    end
  end
end
