Blocitoff::Application.routes.draw do
  
  devise_for :users
  
  get    '/items' => 'items#index'
  post   '/items' => 'items#create'
  delete '/items/:id' => 'items#destroy', as: 'item'
  put    '/items/:id' => 'items#update'
  # resources :items, only: [:index, :create, :destroy, :update]
  resources :users, only: [:show, :index, :update]

  get 'about' => 'welcome#about'  

  root to: "welcome#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :lists, only: [:index, :create]
      end
      resources :lists, only: [] do
        resources :items, only: [:index, :create]
      end
    end
  end
end


# /api/v1/users/:user_id/lists