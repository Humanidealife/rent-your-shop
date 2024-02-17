class Owner::DashboardsController < ApplicationController
  def show
    @user_bookings = current_user.bookings.where(status: 'pending')
    @validate_bookings = current_user.bookings.where(status: 'accepted')
    @incoming_bookings = Booking.includes(:shop).where(shop: { owner: current_user }).where(status: 'pending')
    @shops = current_user.shops
  end
end
