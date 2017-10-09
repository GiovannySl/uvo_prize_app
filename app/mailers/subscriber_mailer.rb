class SubscriberMailer < ApplicationMailer
  def prize_won(subscriber)
    @subscriber = subscriber
    @prizes = Prize.where(active: true).order(created_at: :asc)
    mail(to: subscriber.email, subject: 'Prizes list from UvoPrizeApp')
  end
end
