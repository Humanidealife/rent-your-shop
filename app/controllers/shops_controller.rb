class ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {shop: shop})
      }
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @booking = Booking.new
    @marker = [{
      lat: @shop.latitude,
      lng: @shop.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {shop: @shop})
    }]

  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :price_per_day, :photos[])
  end
end
