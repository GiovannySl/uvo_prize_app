class AuditLog < ApplicationRecord
  belongs_to :prize
  belongs_to :subscriber, optional: true
  belongs_to :condition
end
