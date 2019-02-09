require 'rails_helper'

describe Movie do
  context "validations" do
    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:running_time_minutes) }

    it { should validate_presence_of(:release_date) }

    it { should validate_presence_of(:rating) }
  end
end
