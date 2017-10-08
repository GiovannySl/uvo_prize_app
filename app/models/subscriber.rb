class Subscriber < ApplicationRecord
  has_many :conditions
  has_many :audit_logs

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :try_date, presence: true

  after_create do |subscriber|
    # Send and email with all actives prizes
    # prizes = Prize.where(active: true).order(created_at: :asc)
    # Get just title and description and send the list to subscriber.email
    #logger.info "An email was sent to #{user.email}"
    #PostMailer.#.deliver_now
  end
end
