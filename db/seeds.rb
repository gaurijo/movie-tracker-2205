# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#movies
      river = wb.movies.create!(title: "A River Runs Through It", creation_year: 1994, genre: "Drama", studio_id: wb.id)
      blonde = paramount.movies.create!(title: "Legally Blonde", creation_year: 2004, genre: "Romantic Comedy", studio_id: paramount.id)
      scream = wb.movies.create!(title: "Scream", creation_year: 1998, genre: "Horror", studio_id: wb.id)
      thor = marvel.movies.create!(title: "Thor", creation_year: 2011, genre: "Action", studio_id: marvel.id)
      captain_marvel = marvel.movies.create!(title: "Captain Marvel", creation_year: 2018, genre: "Action", studio_id: marvel.id)
#studios
      wb = Studio.create!(name: "Warner Bros", location: "Burbank")
      paramount = Studio.create!(name: "Paramount", location: "Hollywood")
      marvel = Studio.create!(name: "Marvel", location: "New York")