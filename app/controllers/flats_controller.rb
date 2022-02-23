class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show update destroy edit]
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def show; end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flats_path
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(id: @flat.id)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def edit; end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
