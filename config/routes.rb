Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :events
  root 'events#index'
  #resources :cities, only: [:index, :show]
  #resources :gossips do
      #resources :comments
  #end
end
