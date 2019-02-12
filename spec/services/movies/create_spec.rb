require 'rails_helper'

describe Movies::Create do
  subject { described_class.call(movie_response: movie_response) }

  let(:movie_response) { FactoryBot.build(:api_response_movie) }

  shared_examples "a new actor" do
    it "does create actors" do
      expect { subject }.to change(Actor, :count).from(0).to(movie_response.actors.size)
    end

    it "does set right attributes" do
      subject
      actors = Actor.all
      actors.each do |actor|
        expect(movie_response.actors).to include("#{actor.first_name} #{actor.last_name}")
      end
    end
  end

  shared_examples "a new genre" do
    it "does create genres" do
      expect { subject }.to change(Genre, :count).from(0).to(movie_response.genres.size)
    end

    it "does set right attributes" do
      subject
      genres = Genre.all
      genres.each do |genre|
        expect(movie_response.genres).to include(genre.name)
      end
    end
  end

  shared_examples "a new director" do
    it "does create a director" do
      expect { subject }.to change(Director, :count).from(0).to(1)
    end

    it "does set right attributes" do
      subject
      director = Director.last
      expect(movie_response.director).to include("#{director.first_name} #{director.last_name}")
    end
  end

  shared_examples "a new movie" do
    it "does create a movie" do
      expect { subject }.to change(Movie, :count).from(0).to(1)
    end

    it "does set right attributes" do
      subject
      movie = Movie.last
      expect(movie.title).to eq(movie_response.title)
      expect(movie.language).to eq(movie_response.language)
      expect(movie.rating).to eq(movie_response.rating)
      expect(movie.api_id).to eq(movie_response.api_id)
      expect(movie.running_time_minutes).to eq(movie_response.running_time_minutes)
      expect(movie.release_date).to eq(movie_response.release_date)
    end
  end

  context "when movie already exists" do
    before do
      FactoryBot.create(:movie, title: movie_response.title, release_date: movie_response.release_date)
    end

    it "does not create a new movie" do
      expect { subject }.not_to change(Movie, :count)
    end

    it "does not create new actors" do
      expect { subject }.not_to change(Actor, :count)
    end

    it "does not create a new director" do
      expect { subject }.not_to change(Director, :count)
    end

    it "does not create a new genre" do
      expect { subject }.not_to change(Genre, :count)
    end
  end

  context "when actors already exists" do
    before do
      movie_response.actors.each do |name|
        first = name.split(' ', 2)[0]
        last = name.split(' ', 2)[1]
        FactoryBot.create(:actor, first_name: first, last_name: last)
      end
    end

    it "does not create new actors" do
      expect { subject }.not_to change(Actor, :count)
    end

    it_behaves_like 'a new director'
    it_behaves_like 'a new genre'
    it_behaves_like 'a new movie'
  end

  context "when director already exists" do
    before do
      first = movie_response.director.split(' ', 2)[0]
      last = movie_response.director.split(' ', 2)[1]
      FactoryBot.create(:director, first_name: first, last_name: last)
    end

    it "does not create a new director" do
      expect { subject }.not_to change(Director, :count)
    end

    it_behaves_like 'a new actor'
    it_behaves_like 'a new genre'
    it_behaves_like 'a new movie'
  end

  context "when genres already exist" do
    before do
      movie_response.genres.each { |genre| FactoryBot.create(:genre, name: genre) }
    end

    it "does not create a new genre" do
      expect { subject }.not_to change(Genre, :count)
    end

    it_behaves_like 'a new actor'
    it_behaves_like 'a new director'
    it_behaves_like 'a new movie'
  end

  context "when movie/genre/director/actors are new" do
    it_behaves_like 'a new actor'
    it_behaves_like 'a new genre'
    it_behaves_like 'a new director'
    it_behaves_like 'a new movie'
  end
end
