Rails.application.routes.draw do
  root 'home#index'

  post '/vote', to: "home#vote"
end