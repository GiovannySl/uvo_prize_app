class CreateAuditLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :audit_logs do |t|
      t.references :prize, foreign_key: true
      t.references :subscriber, foreign_key: true
      t.references :condition, foreign_key: true
      t.boolean :delivered

      t.timestamps
    end
  end
end
