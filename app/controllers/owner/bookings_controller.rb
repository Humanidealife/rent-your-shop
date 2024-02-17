class Owner::BookingsController < ApplicationController
  def accept
    @booking = Booking.find(params[:id])
    @booking.status = 'accepted'
    @booking.save
    redirect_to owner_dashboards_path, notice: 'Réservation acceptée avec succès.'
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = 'declined'
    @booking.save
    redirect_to owner_dashboards_path, notice: 'Réservation déclinée avec succès.'
  end
end
