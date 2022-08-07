require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors}
    it { should have_many(:actors).through(:movie_actors)}
  end

  describe 'model methods' do 
    describe 'average_age' do 
      it 'gives an average age of all actors from a movie' do 
            paramount = Studio.create!(name: "Paramount", location: "Hollywood")

            blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)

            jen = blonde.actors.create!(name: "Jennifer Coolidge", age: 45)
            reese = blonde.actors.create!(name: "Reese Witherspoon", age: 33)
            rob = blonde.actors.create!(name: "Oldest Actor", age: 63)
            expect(blonde.average_age).to eq(47)
        end
      end
    end
  end
