Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  namespace :panel do
    root to: 'home#index'

    resources :images
    resources :videos
  end

  namespace :admin do
    root to: 'home#index'
  end
end
