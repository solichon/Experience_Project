class BookingsController < ApplicationController

  def new
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new
    #Avoir un JS qui fait apparaitre "Votre prix total est @booking.total_price"
  end

  def create
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new(booking_params)
    @booking.timeslot = @timeslot
    if @booking.save
      redirect_to timeslot_path(@booking.timeslot)
    else
      render :new
    end
  end

  private

  def booking_params
    par = params.require(:booking).permit(:adults, :children, :comments,
     :status, :activity, :timeslot_id, :client_id, :channel_source)
    par["status"] = par["status"].to_i
    par["channel_source"] = par["channel_source"].to_i
    par
  end
end
