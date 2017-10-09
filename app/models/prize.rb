class Prize < ApplicationRecord
  has_many :conditions
  has_many :audit_logs

  validates :title, presence: true
  validates :description, presence: true
  validates :existences, presence: true
  validates :active, presence: true

end
