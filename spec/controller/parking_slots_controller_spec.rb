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

  describe "ParkingSlot#update" do
    it "unpark a vehicle froma a parking slot" do
      parking_slot = FactoryBot.create(:parking_slot)
      patch :update, params: {id: parking_slot.id, parked: false}
      updated_slot =  ParkingSlot.find_by(id: parking_slot.id)
      parking_slots_count = ParkingSlot.all.count
      expect(parking_slots_count).to eq(1)
      expect(updated_slot.parked).to eq(false)
      expect(parking_slot.parked).to eq(true)
      expect(response).to redirect_to("/parking_slots")
    end
  end
end
