require 'rails_helper'

describe Zipcode do
  context "validations" do
    it { should validate_presence_of(:code) }
  end
end
