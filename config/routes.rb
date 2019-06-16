Rails.application.routes.draw do

  root to: 'categories#index'

  # login form
  get '/login' => 'session#new'
  # login form submits here
  post '/login' => 'session#create'
  # log out
  delete '/login' => 'session#destroy'


  resources :categories, only:[:index, :show]

  resources :users, except:[:index]

  get '/recipes/search' => 'recipes#search'

  resources :recipes, except:[:index]
  # define a route to create a review, passing the recipe_id
  post '/recipes/:id/new_review' => 'reviews#create', as: 'new_review'
  # click one food, it links to its recipe list page
  get '/foods/:id' => 'recipes#by_food', as:'food_recipes'
  # click on each
  get '/categories/:id/recipes' => 'recipes#index', as:'recipes_index'

  # make reviews [:create] exception, so rails won't generate path automatically for us, and we can customise the path as above with recipe_id passed over!!!
  resources :reviews, except:[:new, :create, :index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
