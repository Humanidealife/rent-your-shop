class BookingsController < ApplicationController
  def create
    @shop = Shop.find(params[:booking][:shop_id])
    @booking = Booking.new(booking_params)
    @booking.shop = @shop
    @booking.renter = current_user
    if @booking.save
      redirect_to owner_dashboards_path
    else
      render "shops/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :ending_date, :shop_id)
  end
end
