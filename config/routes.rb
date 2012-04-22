RablTalk::Application.routes.draw do
  get "posts/index"
  get "users/show"
  resources :users
  resources :users, :only => [:show, :index]
  resources :posts, :only => [:index]
end

