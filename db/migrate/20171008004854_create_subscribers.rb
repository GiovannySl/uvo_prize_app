class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.datetime :try_date

      t.timestamps
    end
  end
end
