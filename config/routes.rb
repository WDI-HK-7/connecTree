Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#index'

  resources :posts, :only => [:create, :show, :index, :destroy, :update] do
    resources :comments, :only => [:create, :show, :index, :destroy, :update]
  end
  
  resources :likes, :only=> [:create, :show, :index, :destroy, :update]
end
