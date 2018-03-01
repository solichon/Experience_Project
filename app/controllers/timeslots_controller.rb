class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all
  end
end
