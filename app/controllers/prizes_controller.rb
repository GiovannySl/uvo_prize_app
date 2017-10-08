class PrizesController < ApplicationController
  def index
    @prizes = Prize.where(active: true).order(created_at: :asc).limit(100)
  end

  def new
    @prize = Prize.new
  end

  def create
    # @prize = Prize.new(prize_params.merge!({active: true}))
    # if @prize.save
    #   redirect_to prizes_path
    # else
    #   render :new
    # end
  end

  def edit
    
  end

  def delete
  end

  private
  def prize_params
    params.require(:prize).permit(:title, :description, :existences)
  end
  def prize_edit_params
    params.require(:prize).permit(:id)
  end
end
