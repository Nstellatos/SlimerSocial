Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  
  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to:'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do 
    resources :reviews 
  end
end
