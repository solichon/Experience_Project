class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all
    respond_to do |format|
      format.html
      format.json
    end
  end



  def show
    @timeslot = Timeslot.find(params[:id])
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.empty!
    activity = Activity.find(timeslot_params[:activity_id])
    @timeslot.end_datetime = @timeslot.start_datetime + activity.duration_in_minutes * 60
    if @timeslot.save
      redirect_to timeslots_path
    else
      render :new
    end
  end

    private

  def timeslot_params
    params.require(:timeslot).permit(:start_datetime, :end_datetime, :activity_id)
  end
end
