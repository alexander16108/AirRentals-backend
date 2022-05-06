class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]

  def index
    data = []

    User.find(params[:user_id]).reservations.each do |reservation|
      reservation_data = { reservation_info: reservation, plane_info: reservation.plane }
      data << reservation_data
    end
    render json: data
  end

  def show
    reservarion = { reservation_info: @reservation, plane_info: @reservation.plane }
    render json: reservarion
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :plane_id, :date_of_reservation, :end_of_reservation, :cancelled)
  end
end
