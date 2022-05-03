class PlanesController < ApplicationController
  def index
    @planes = Plane.all
    render json: @planes, status: :ok
  end

  def show
    @plane = Plane.find(params[:id])
    if @plane
      render json: @plane, status: :ok
    else
      render json: @plane.errors, status: :unprocessable_entity
    end
  end

  def create
    plane = Plane.new(Planes_params)
    plane.reservation_expiry_date = Date.civil(DateTime.now.year, DateTime.now.month, -1) - 1.month
    if plane.save
      render json: { success: true, Planes: plane }, status: :created
    else
      render json: Planes.errors, status: :unprocessable_entity
    end
  end

  def Planes_params
    params.require(:Planes).permit(:name, :capacity, :range, :url, :speed, :city, :images, :price)
  end
end
