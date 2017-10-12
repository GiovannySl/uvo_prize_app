class ConditionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def new
    @prize_id = condition_edit_params["id"].to_i
  end

  def create
    #debugger
    prize = Prize.find_by(id: condition_edit_params[:id].to_i)
    if prize
      @condition = Condition.new(condition_params)
      @condition = prize.conditions.build(@condition.as_json)
      if (condition_params["number"].to_i > 0) && (condition_params["after_num"].to_i >= 0) && @condition.save
        redirect_to prizes_path, flash: { success: 'The condition has been created' }
      else
        redirect_to new_condition_path, flash: { error: 'Invalid params' }
      end
    else
      redirect_to prizes_path, flash: { error: 'Prize not found' }
    end
  end

  def delete
    @condition = Condition.find_by(id: condition_edit_params[:id].to_i)
    if  @condition
      @condition.delete
      redirect_to prizes_path, flash: { alert: 'The condition has been deleted' }
    else
      redirect_to prizes_path, flash: { error: 'Condition not found' }
    end
  end

  private
  def condition_params
    params.permit(:number, :after_num, :condition_type)
  end
  def condition_edit_params
    params.permit(:id)
  end
end
