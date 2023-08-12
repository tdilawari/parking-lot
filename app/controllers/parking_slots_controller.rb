class ParkingSlotsController < ApplicationController
  def new
    @parking_slot = ParkingSlot.new
    @entry_gate = params[:entry_gate]
    @vehicle = Vehicle.find_by(id: params[:vehicle_id])
  end

  def create
    @parking_slot = ParkingSlot.create!(parking_slots_params)
    @parking_slot.update(parked: true)
    if @parking_slot.save
      flash[:success] = "New slot parked."
      redirect_to root_path
    end
  end 

  private

  def parking_slots_params
    params.require(:parking_slot).permit(:slot, :vehicle_id, :entry_gate)
  end
end
