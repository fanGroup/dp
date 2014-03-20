Dp::Application.routes.draw do
 
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :dishes

  get '/landing_page', to: 'landing#index'

  devise_for :users
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
end
