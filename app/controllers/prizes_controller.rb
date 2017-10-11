class PrizesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    @prizes = Prize.where(active: true).order(created_at: :asc).limit(100)
  end

  def new
  end

  def create
    @prize = Prize.new(prize_params.merge!({active: true}))
    if (prize_params["existences"].to_i > 0) && @prize.save
      redirect_to prizes_path, flash: { success: 'The prize has been created' }
    else
      redirect_to new_prize_path, flash: { error: 'Invalid params' }
    end
  end

  def edit
    @prize = Prize.find_by(id: prize_edit_params[:id].to_i)
    unless @prize
      redirect_to edit_prize_path, flash: { error: 'Invalid params' }
    end
  end

  def update
    @prize = Prize.find_by(id: prize_edit_params[:id].to_i)
    if validate_prize_params(prize_params)
      redirect_to prizes_path, flash: { alert: 'The prize has been edited' }
    else
      redirect_to edit_prize_path, flash: { error: 'Invalid params' }
    end
  end

  def delete
    @prize = Prize.find_by(id: prize_edit_params[:id].to_i)
    if @prize
      @prize.update_columns(active: false)
      redirect_to prizes_path, flash: { alert: 'The prize has been deleted' }
    else
      redirect_to prizes_path, flash: { error: 'The prize could not been deleted' }
    end
  end

  private
  def prize_params
    params.permit(:title, :description, :existences)
  end
  def prize_edit_params
    params.permit(:id)
  end
  def validate_prize_params(prize_p)
    existence_num = prize_p["existences"].to_i
    if prize_p["title"] && prize_p["description"] && (existence_num.to_i > 0)
      true
    else
      false
    end
  end
end
