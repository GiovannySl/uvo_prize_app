class Subscriber < ApplicationRecord
  has_many :conditions
  has_many :audit_logs

  validates :email, presence: true

  after_create do |subscriber|
    # Send and email with all actives prizes
    SubscriberMailer.prize_won(subscriber).deliver_now
  end
end
