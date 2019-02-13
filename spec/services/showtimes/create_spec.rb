require 'rails_helper'

describe Showtimes::Create do
  subject { described_class.call(showtime_response: showtime_response) }

  let(:showtime_response) { FactoryBot.build(:api_response_showtime) }

  shared_examples "a valid showtime" do
    it "does create a new showtime" do
      expect { subject }.to change(Showtime, :count).from(0).to(1)
    end

    it "does create an accurate showtime" do
      subject
      movie = Movie.last
      theater = Theater.last
      showtime = Showtime.last
      expect(showtime.movie).to eq(movie)
      expect(showtime.theater).to eq(theater)
      expect(showtime.ticket_link).to eq(showtime_response.ticket_link)
      expect(showtime.screening_date).to eq(showtime_response.screening_date)
    end
  end

  context "when no movie or theater exists" do
    it "does create a new movie" do
      expect { subject }.to change(Movie, :count).from(0).to(1)
    end

    it "does create a new theater" do
      expect { subject }.to change(Theater, :count).from(0).to(1)
    end

    it_behaves_like "a valid showtime"
  end

  context "when movie and theater exists" do
    before do
      FactoryBot.create(:theater, name: showtime_response.theater_response.name, zipcode: showtime_response.theater_response.zipcode)
      FactoryBot.create(:movie, title: showtime_response.movie_response.title, release_date: showtime_response.movie_response.release_date)
    end

    it "does not create a new movie" do
      expect { subject }.not_to change(Movie, :count)
    end

    it "does not create a new theater" do
      expect { subject }.not_to change(Theater, :count)
    end

    it_behaves_like "a valid showtime"
  end

end
