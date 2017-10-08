class CreatePrizes < ActiveRecord::Migration[5.1]
  def change
    create_table :prizes do |t|
      t.string :title
      t.string :description
      t.string :existences
      t.boolean :active

      t.timestamps
    end
  end
end
