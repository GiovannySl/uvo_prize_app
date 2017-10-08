class AddPrizeReferencesToConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :conditions, :prize, foreign_key: true
  end
end
