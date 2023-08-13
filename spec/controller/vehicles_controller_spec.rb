# frozen_string_literal: true

require "rails_helper"

RSpec.describe VehiclesController, type: :controller do
  let(:vehicle_params) do
    {
      "vehicle"=> {
        color: "yellow",
        registeration_number: "PB09123",
        type: "TwoWheeler"
      }
    }
  end
  let(:vehicle) { FactoryBot.create(:two_wheeler) }

  describe 'POST#create' do
    it "create a vehicle" do
      vehicle_count = Vehicle.all.count
      post :create, params: vehicle_params
      expect(vehicle_count).to eq(0)
      expect(Vehicle.all.count).to eq(1)
      expect(Vehicle.last.color).to eq("yellow")
      expect(Vehicle.last.registeration_number).to eq("PB09123")
      expect(response).to redirect_to("/parking_slots/new?vehicle_id=#{Vehicle.last.id}")
    end
  end

  describe "PATCH #update" do
    context "change color or registeration number" do
      it "updates the color and redirects" do
        vehicle =  FactoryBot.create(:vehicle)
        patch :update, params: {id: vehicle.id, "two_wheeler"=> {color: "yellow", registeration_number: "PB0877"}}
        updated_vehicle =  Vehicle.find_by(id: vehicle.id)
        expect(updated_vehicle.color).to eq("yellow")
        expect(updated_vehicle.registeration_number).to eq("PB0877")
        expect(response).to redirect_to("/parking_slots/new?vehicle_id=#{Vehicle.last.id}")
      end
    end
  end
end
