Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  patch 'switch_user/:id', to: 'masquerade#switch_user', as: :switch_user
  patch 'switch_back',     to: 'masquerade#switch_back', as: :switch_back

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

  namespace :api do
    post '/login',         to: 'auth#login'
    get '/logout',         to: 'auth#logout'

    post '/login_channel', to: 'pusher#login_channel'
  end
end
