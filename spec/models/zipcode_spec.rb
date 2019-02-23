require 'rails_helper'

describe Zipcode do
  context "validations" do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }

    it { should validate_uniqueness_of(:code) }
  end
end
