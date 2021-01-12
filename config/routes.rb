Rails.application.routes.draw do

  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # We are going to list our resources here
      # Authentication and Authorization routes
      post 'login',     to: 'authentication#authenticate'
      post 'register',  to: 'authentication#registration'
      get 'checkAuth',  to: 'authentication#checkAuth'
      get 'user',  to: 'user#show'

      # Admin Routes
      # dashboard
      get 'admin/dashboard', to: 'admin/dashboard#dashboard'

      # movie genres route
      resources :genres
      # movie characters route
      resources :characters
      # movies info route
      resources :movies
      # uploading movie cover
      post 'movie/activate', to: 'movies#activate'
      post 'uploadMovieCover', to: 'upload_files#uploadMovieCover'
      post 'uploadMovieFile', to: 'upload_files#uploadMovieFile'
    end
  end
end
