require 'rails_helper'

describe Theaters::Create do
  subject { described_class.call(theater_response: theater_response) }

  let(:theater_response) { FactoryBot.build(:api_response_theater) }

  context "when theater exists" do
    before do
      FactoryBot.create(:theater, name: theater_response.name, zipcode: theater_response.zipcode)
    end

    it "does not create a new theater" do
      expect { subject }.not_to change(Theater, :count)
    end
  end

  context "when theater does not exist" do

    it "does create a new theater" do
      expect { subject }.to change(Theater, :count).from(0).to(1)
    end

    it "does set the right attributes" do
      subject
      theater = Theater.last
      expect(theater.name).to eq(theater_response.name)
      expect(theater.zipcode).to eq(theater_response.zipcode)
      expect(theater.address).to eq(theater_response.address)
      expect(theater.city).to eq(theater_response.city)
      expect(theater.phone_number).to eq(theater_response.phone_number)
      expect(theater.state).to eq(theater_response.state)
      expect(theater.latitude.to_s.slice(3)).to eq(theater_response.latitude.to_s.slice(3))
      expect(theater.longitude.to_s.slice(3)).to eq(theater_response.longitude.to_s.slice(3))
    end
  end
end
