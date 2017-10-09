class Condition < ApplicationRecord
  belongs_to :subscriber, optional: true
  belongs_to :prize
  has_many :audit_logs

  validates :number, presence: true
  validates :after_num, presence: true
  validates :condition_type, presence: true
  
end
