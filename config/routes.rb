Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#index'

  resources :posts, :only => [:create, :show, :index, :destroy, :update, :current] 

  get '/current_user', to: 'users#current' #users is the controller, current is the method
  get '/users/:id/posts', to: 'posts#userfeed'
  get '/*path' => 'static_pages#index'

end
