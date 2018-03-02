class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    #Avoir un JS qui fait apparaitre "Votre prix total est @booking.total_price"
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to timeslot_path(@booking.timeslot)
    else
      render :new
    end
  end

  private

  def booking_params
    par = params.require(:booking).permit(:adults, :children, :comments,
     :status, :activity, :timeslot_id, :client_id)
    par["status"] = par["status"].to_i
    par
  end
end
