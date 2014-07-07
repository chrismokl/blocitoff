Blocitoff::Application.routes.draw do
  get "items/index"
  get "welcome/index"
  devise_for :users

  get '/items' => 'items#index'
end
