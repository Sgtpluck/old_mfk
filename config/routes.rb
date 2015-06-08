Rails.application.routes.draw do
  root 'home#index'

  post '/vote', to: "home#vote"

  post '/person', to: "home#add_person", as: :people
end