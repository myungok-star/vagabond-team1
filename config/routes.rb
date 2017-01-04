Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'sessions#index'


# these routes are for showing users a login form, logging them in, and logging them out.
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'

get '/users/:id', to: "users#show", as: "user"
get '/users/:id/edit', to: "users#edit", as: "edit_user"
# put '/users/:id', to: "users#update"
put '/users/:id', to: "users#update", as: "user_update"

get '/users/:user_id/posts/:id', to: 'users#show_post', as: "post"

get '/cities/:id', to: "cities#show", as: "city"



end
