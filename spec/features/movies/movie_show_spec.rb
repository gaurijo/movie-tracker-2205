require 'rails_helper' 

# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# 

RSpec.describe 'Movie Show Page' do 
   it "lists a particular movie's title, creation year, and genre" do 

      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")

      river = Movie.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: wb.id)
      blonde = Movie.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      scream = Movie.create!(title: "Scream", creation_year: 1998, genre: "Horror", studio_id: paramount.id)
      thor = Movie.create!(title: "Thor", creation_year: 2011, genre: "Action", studio_id: marvel.id)
      captain_marvel = Movie.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)


      # river = wb.movies.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: wb.id)
      # blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      # scream = wb.movies.create!(title: "Scream", creation_year: 1998, genre: "Horror", studio_id: wb.id)
      # thor = marvel.movies.create!(title: "Thor", creation_year: 2011, genre: "Action", studio_id: marvel.id)
      # captain_marvel = marvel.movies.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)

      visit "/movies/#{river.id}" 

      expect(page).to have_content("A River Runs Through It")
      expect(page).to have_content(1994)
      expect(page).to have_content("Drama")
      expect(page).to_not have_content("Horror")
   end
# and a list of all its actors from youngest to oldest.
# # And I see the average age of all of the movie's actors

   it "lists all of its actors from youngest to oldest" do 
      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      
      river = Movie.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: wb.id)
      blonde = Movie.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      
      jen = Actor.create!(name: "Jennifer Coolidge", age: 45)
      reese = Actor.create!(name: "Reese Witherspoon", age: 33)
      brad = Actor.create!(name: "Brad Pitt", age: 50)

      movie_actor1 = MovieActor.create!(movie_id: blonde.id, actor_id: jen.id)
      movie_actor2 = MovieActor.create!(movie_id: blonde.id, actor_id: reese.id)
      movie_actor2 = MovieActor.create!(movie_id: river.id, actor_id: brad.id)

      visit "/movies/#{blonde.id}" 

      expect(page).to have_content("Reese Witherspoon")
      expect(page).to have_content("Jennifer Coolidge")
      expect(page).to_not have_content("Brad Pitt")
   end

   it "displays an average age of all of the movie's actors" do 
      
      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      
      river = Movie.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: paramount.id)
      blonde = Movie.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      
      jen = Actor.create!(name: "Jennifer Coolidge", age: 45)
      reese = Actor.create!(name: "Reese Witherspoon", age: 33)
      bob = Actor.create!(name: "Bob Pitt", age: 50)

      movie_actor1 = MovieActor.create!(movie_id: blonde.id, actor_id: jen.id)
      movie_actor2 = MovieActor.create!(movie_id: blonde.id, actor_id: reese.id)
      movie_actor2 = MovieActor.create!(movie_id: blonde.id, actor_id: bob.id)

      visit "/movies/#{blonde.id}" 

      expect(page).to have_content("Average age: 42")
   end

   it 'only displays the actors associated with that movie' do 
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")

      blonde = Movie.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      captain_marvel = Movie.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)

      brie = Actor.create!(name: "Brie Larson", age: 30)
      sam = Actor.create!(name: "Samuel L Jackson", age: 55)
      reese = Actor.create!(name: "Reese Witherspoon", age: 33)

      movie_actor1 = MovieActor.create!(movie_id: blonde.id, actor_id: reese.id)
      movie_actor2 = MovieActor.create!(movie_id: captain_marvel.id, actor_id: brie.id)
      movie_actor2 = MovieActor.create!(movie_id: captain_marvel.id, actor_id: sam.id)


      visit "/movies/#{captain_marvel.id}" 

      expect(page).to have_content("Brie Larson")
      expect(page).to have_content("Samuel L Jackson")
      expect(page).to_not have_content("Reese Witherspoon")
   end

   it 'displays a form to add an actor to that movie' do 

      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")

      captain_marvel = Movie.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)
      blonde = Movie.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)

      brie = Actor.create!(name: "Brie Larson", age: 30)
      sam = Actor.create!(name: "Samuel L Jackson", age: 55)
      reese = Actor.create!(name: "Reese Witherspoon", age: 33)

      movie_actor1 = MovieActor.create!(movie_id: blonde.id, actor_id: reese.id)
      movie_actor2 = MovieActor.create!(movie_id: captain_marvel.id, actor_id: brie.id)
      movie_actor2 = MovieActor.create!(movie_id: captain_marvel.id, actor_id: sam.id)

      visit "/movies/#{blonde.id}" 

      fill_in('Name', with: "Jennifer Coolidge")

      click_on "Submit"

      expect(current_path).to eq("/movies/#{blonde.id}")
      expect(page).to have_content("Jennifer Coolidge")
   end
end

# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)