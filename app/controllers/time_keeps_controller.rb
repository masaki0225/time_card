class TimeKeepsController < ApplicationController
  def index
  end

  def show
    @time_keep = Timekeep.today(current_user)
  end

  def create
    @time_keep = TimeKeep.today(current_user)
    
    if params[:in]
      @time_keep.in_at = Time.now
    elsif params[:out]
      @time_keep.out_at = Time.now
    end

    if @time_card.save
      render json: { status: 'success', time_card: @time_card, working_status: @time_card.working_status }
    else
      render json: { status: 'error' }
    end
  end

end
