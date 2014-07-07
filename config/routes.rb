Blocitoff::Application.routes.draw do
  get    '/items' => 'items#index'
  post   '/items' => 'items#create'
  delete '/items/:id' => 'items#destroy', as: 'item'
  # resources :items, only: [:index, :create, :destroy]
  devise_for :users

  

  root to: "welcome#index"
end
