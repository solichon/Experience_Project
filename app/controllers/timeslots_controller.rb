class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end
end
