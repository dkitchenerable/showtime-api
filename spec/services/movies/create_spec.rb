require 'rails_helper'

describe Movies::Create do
  subject { described_class.call(movie_response: movie_response) }

  let(:movie_response) { FactoryBot.create(:api_response_movie) }

  before do
    subject
  end

  context "when movie already exists" do
  end

  context "when director already exists" do
  end  

  context "when genres already exist" do
  end

  context "when movie/genre/director/actors are new" do
    it "does create actors" do
    end
  end  
end
