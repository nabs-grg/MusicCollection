Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # URL we visit, resources is the keyword here and musics is going to be the name of the controller or table
  resources :musics
  root 'musics#index'
end
