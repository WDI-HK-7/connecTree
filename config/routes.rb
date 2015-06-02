Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#index'

  resources :posts, :only => [:create, :show, :index, :destroy, :update] 
end
