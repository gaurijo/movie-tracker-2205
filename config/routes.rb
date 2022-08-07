Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/movies/:id', to: 'movies#show'
  post '/movieactors', to: 'movie_actors#create'
  post '/movies/:id', to: 'movies#create'
end
