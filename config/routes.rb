Rails.application.routes.draw do
  
  devise_for :users
  root "static_pages#home"
  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end
end
