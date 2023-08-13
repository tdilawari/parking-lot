# frozen_string_literal: true

require "rails_helper"

RSpec.describe ParkingSlotsController, type: :controller do
  let(:vehicle) { FactoryBot.create(:vehicle) }
  let(:parking_slot_params) do
    {
      "parking_slot"=> {
        vehicle_id: vehicle.id,
        parked: true,
        entry_gate: 2,
        slot: "A01"
      }
    }
  end

  describe 'ParkingSlot#create' do
    it "park a vehicle in a given parking slot" do
      slot_count = ParkingSlot.all.count
      post :create, params: parking_slot_params
      expect(slot_count).to eq(0)
      expect(ParkingSlot.all.count).to eq(1)
      expect(ParkingSlot.last.parked).to eq(true)
      expect(ParkingSlot.last.entry_gate).to eq(2)
      expect(ParkingSlot.last.slot).to eq("A01")
      expect(response).to redirect_to("/")
    end
  end

  describe "ParkingSlot#destroy" do
    it "unpark a vehicle froma a parking slot" do
      parking_slot = FactoryBot.create(:parking_slot)
      parking_slots_count = ParkingSlot.all.count
      delete :destroy, params: { id: parking_slot.id }
      expect(parking_slots_count).to eq(1)
      expect(ParkingSlot.all.count).to eq(0)
      expect(response).to redirect_to("/parking_slots")
    end
  end
end
