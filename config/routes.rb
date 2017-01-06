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
get '/users/:user_id/posts/:id/edit', to: "users#edit_post", as:"edit_post"

get 'cities', to: "cities#index", as: "cities"
get '/cities/:id', to: "cities#show", as: "city"

get '/cities/:id/post/new', to: "posts#new", as: "new_post"
post '/cities/:id/post/new', to: "posts#create"
post '/users/:user_id/posts/:id/edit', to: "posts#update_post"
delete '/users/:user_id/posts/:id', to: "posts#destroy", as: "delete_post"

post "/posts/:id/comment/new", to: "comments#create", as: "post_comment"
delete '/posts/:post_id/comment/:id', to: 'comments#destroy', as: 'delete_comment'


end
