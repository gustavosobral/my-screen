Rails.application.routes.draw do
  scope '/panel' do
    devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  end

  namespace :panel do
    root to: 'home#index'

    resources :images
    resources :videos
  end
end
