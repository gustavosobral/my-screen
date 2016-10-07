Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  patch 'switch_user/:id', to: 'masquerade#switch_user', as: :switch_user
  patch 'switch_back',     to: 'masquerade#switch_back', as: :switch_back

  post 'pusher/auth', to: 'pusher#auth'

  namespace :panel do
    root to: 'home#index'

    get   '/profile', to: 'home#profile'
    patch '/profile', to: 'home#update_profile'

    resources :images,    except: [:show]
    resources :videos,    except: [:show]
    resources :playlists, except: [:show]
    resources :terminals, only:   [:index, :edit, :update]
  end

  namespace :admin do
    root to: 'home#index'

    get   '/profile', to: 'home#profile'
    patch '/profile', to: 'home#update_profile'

    resources :users,     except: [:show]
    resources :terminals, except: [:show]
  end
end
