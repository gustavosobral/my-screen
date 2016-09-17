Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  get 'switch_user/:id', to: 'masquerade#switch_user', as: :switch_user
  get 'switch_back'    , to: 'masquerade#switch_back', as: :switch_back

  namespace :panel do
    root to: 'home#index'

    get   '/profile', to: 'home#profile'
    patch '/profile', to: 'home#update_profile'

    resources :images, except: [:show]
    resources :videos, except: [:show]
  end

  namespace :admin do
    root to: 'home#index'

    get   '/profile', to: 'home#profile'
    patch '/profile', to: 'home#update_profile'

    resources :users, except: [:show]
  end
end
