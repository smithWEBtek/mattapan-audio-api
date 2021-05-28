Rails.application.routes.draw do
	root 'api/audio_files#index'
	get '/api/markers', to: 'api/audio_files#markers'
	namespace :api do
	  resources :audio_files
	end
end
