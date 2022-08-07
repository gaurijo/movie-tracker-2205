require 'rails_helper'

RSpec.describe MovieActor, type: :model do 
   describe 'relationships' do 
      it { should belong_to :movie }
      it { should belong_to :actor }
   end
end

   # describe 'model methods' do 
   #    describe 'actors_youngest_to_oldest' do 
   #       it 'lists actors from youngest to oldest' do 
   #          paramount = Studio.create!(name: "Paramount", location: "Hollywood")

   #          blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)

   #          jen = blonde.actors.create!(name: "Jennifer Coolidge", age: 45)
   #          reese = blonde.actors.create!(name: "Reese Witherspoon", age: 33)
   #          rob = blonde.actors.create!(name: "Oldest Actor", age: 63)
   
   #          expect(blonde.actors.order_by_youngest).to eq([reese, jen, rob]) 
   #       end
   #    end

      # describe 'average_age' do 
      #    it 'gives an average age of all actors from a movie' do 
      #       paramount = Studio.create!(name: "Paramount", location: "Hollywood")

      #       blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)

      #       jen = blonde.actors.create!(name: "Jennifer Coolidge", age: 45)
      #       reese = blonde.actors.create!(name: "Reese Witherspoon", age: 33)
      #       rob = blonde.actors.create!(name: "Oldest Actor", age: 63)
      #       expect(self.average_age).to eq(47)
      #    end
      # end