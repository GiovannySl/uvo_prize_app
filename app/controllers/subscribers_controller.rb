class SubscribersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def home
  end

  def create
    @p_subscriber = Subscriber.where(email: subscriber_params["email"]).order(created_at: :desc).first
    subscriber_email = subscriber_params
    if @p_subscriber
      if (@p_subscriber.created_at + 1.day) < Time.now 
        valid_try(subscriber_email)
      else
        redirect_to root_path, flash: { alert: 'This email was already registered today.' }
      end
    else
      valid_try(subscriber_email)
    end 
  end

  private
  def subscriber_params
    params.permit(:email)
  end

  def valid_try(subscriber_email)
    #debugger
    @subscriber = Subscriber.create(subscriber_email)
    Condition.order(created_at: :asc).each do |c_condition|
      if @subscriber.id >= c_condition.after_num
        #debugger
        case c_condition.condition_type
        when "M"
          #debugger
          win_prize(c_condition) if (@subscriber.id % c_condition.number) == 0
        when "S"
          #debugger
          win_prize(c_condition) if c_condition.number == @subscriber.id
        end
      end
    end
    #debugger
    find_prize(@subscriber)
  end
  
  def win_prize(c_condition)
    #debugger
    @audit_log = AuditLog.new({delivered: false})
    @audit_log = c_condition.audit_logs.build(@audit_log.as_json)
    @audit_log = c_condition.prize.audit_logs.build(@audit_log.as_json)
    @audit_log.save
  end

  def find_prize(subscriber)
    #debugger
    audit_log = AuditLog.where(delivered: false).order(created_at: :asc).first
    if audit_log
      #debugger
      subscriber.audit_logs << audit_log
      audit_log.update(delivered: true)
      deliver_prize(audit_log.prize_id)
    else
      #debugger
      redirect_to root_path, flash: { error: 'Try again tomorrow.' }
    end
  end

  def deliver_prize(prize_id)
    #debugger
    prize = Prize.find_by(id: prize_id)
    prize.update(existences: (prize.existences.to_i - 1))
    if prize.existences == "0"
      #debugger
      prize.update_columns(active: false)
    end
    redirect_to root_path, flash: { success: "You won this prize: #{prize.title}, Description: #{prize.description}." }
  end
end
