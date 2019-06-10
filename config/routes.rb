Rails.application.routes.draw do


  root to: 'nutritions#home'

  # login form
  get '/login' => 'session#new'
  # login form submits here
  post '/login' => 'session#create'
  # log out
  delete '/login' => 'session#destroy'


  resources :users, except:[:index]

  resources :recipes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
