class Owner::ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.owner = current_user

    if @shop.save
      redirect_to owner_dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :description, :price_per_day, :address, :category, photos: [])
  end
end
