Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'static_pages#index'

  resources :posts, :only => [:create, :show, :index, :destroy, :update]

  get '/current_user',       to: 'users#current' #users is the controller, current is the method
  get '/current_user/posts', to: 'posts#userfeed' #users is the controller, current is the method

  # devise_scope :user do
  #   get "posts", to: "posts#userfeed"
  # end
  
  get '/*path' => 'static_pages#index'

end
