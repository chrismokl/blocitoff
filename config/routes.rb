Blocitoff::Application.routes.draw do
  get "items/index"
  get '/items' => 'items#index'
  devise_for :users

  

  root to: "welcome#index"
end
