require 'rails_helper' 

RSpec.describe 'studio index page' do 
   it 'lists the name and location of each studio' do 
      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")

      visit '/studios'

      within "#studio-#{wb.id}" do 
         expect(page).to have_content("Warner Bros")
         expect(page).to have_content("Burbank")
      end

      within "#studio-#{paramount.id}" do 
         expect(page).to have_content("Paramount")
         expect(page).to have_content("Hollywood")
      end
      
      within "#studio-#{marvel.id}" do 
         expect(page).to have_content("Marvel")
         expect(page).to have_content("New York")
      end
   end
   
   it 'lists the titles of all its movie underneath each studio name' do 
      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")

      river = wb.movies.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: wb.id)
      blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      scream = wb.movies.create!(title: "Scream", creation_year: 1998, genre: "Horror", studio_id: wb.id)
      thor = marvel.movies.create!(title: "Thor", creation_year: 2011, genre: "Action", studio_id: marvel.id)
      captain_marvel = marvel.movies.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)

      visit '/studios'

      within "#studio-#{wb.id}" do 
         expect(page).to have_content("A River Runs Through It")
         expect(page).to have_content("Scream")
      end
      within "#studio-#{paramount.id}" do 
         expect(page).to have_content("Legally Blonde")
      end
      within "#studio-#{marvel.id}" do 
         expect(page).to have_content("Thor")
         expect(page).to have_content("Captain Marvel")
      end
   end
end