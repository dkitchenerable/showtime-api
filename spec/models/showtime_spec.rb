require 'rails_helper'

describe Showtime do
  context "validations" do
    it { should validate_presence_of(:movie) }
    it { should validate_presence_of(:theater) }
    it { should validate_presence_of(:screening_date) }
  end
end
