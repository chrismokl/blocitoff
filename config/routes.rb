Blocitoff::Application.routes.draw do
  
  devise_for :users
  get    '/items' => 'items#index'
  post   '/items' => 'items#create'
  delete '/items/:id' => 'items#destroy', as: 'item'
  # resources :items, only: [:index, :create, :destroy]
  resources :users, only: [:show, :index, :update] do 
    resources :items, only: [:index], controller: 'users/items' #maybe items_controller
  end

  get 'about' => 'welcome#about'  

  root to: "welcome#index"
end
