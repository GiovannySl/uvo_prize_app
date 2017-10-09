class AddSubscriberReferencesToConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :conditions, :subscriber, foreign_key: true
  end
end
