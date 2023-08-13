class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.find_by(vehicle_params)
    unless @vehicle.present?
      @vehicle = Vehicle.new(vehicle_params)
    end
    if @vehicle.save
      redirect_to url_for(:controller => :parking_slots, :action => :new, :vehicle_id => @vehicle.id, :entry_gate => params[:vehicle][:entry_gate])
    else
      render 'new'
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    vehicle_type_param = @vehicle.type == "TwoWheeler" ? params["two_wheeler"] : params["four_wheeler"]
    if @vehicle.update(color: vehicle_type_param["color"], registeration_number: vehicle_type_param[:registeration_number])
      redirect_to url_for(:controller => :parking_slots, :action => :new, :vehicle_id => @vehicle.id, :entry_gate => vehicle_type_param[:entry_gate])
    end
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:color, :registeration_number, :type)
  end
end
