Rails.application.routes.draw do
  devise_for :users
  
  resources :trips do
    resources :locations
  end

  resources :locations do 
    resources :addresses
  end
end
