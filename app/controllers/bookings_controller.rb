class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    #Avoir un JS qui fait apparaitre "Votre prix total est @booking.total_price"
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total_price = @booking.timeslot.activity.adult_price * @booking.adults + @booking.timeslot.activity.child_price * @booking.children
    if @timeslot.save
      redirect_to timeslot_path
    else
      render :new
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:adults, :children, :comments, :status, :total_price_cents)
  #channel voluntary forgotten
  end
end
