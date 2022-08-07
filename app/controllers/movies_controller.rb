class MoviesController < ApplicationController
   def show 
      @movie = Movie.find(params[:id])
   end

   def create #got confused here had to look this up
      @movie = Movie.find(params[:id])
      @actor = Actor.create!(name: params[:name], age: params[:age])
      @movie.actors << @actor
      # @movie_actor = MovieActor.create!(movie_id: @movie, actor_id: @actor)

      redirect_to "/movies/#{@movie.id}"
   end
end