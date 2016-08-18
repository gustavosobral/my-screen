Rails.application.routes.draw do
  scope '/admin' do
    devise_for :users
  end
  
  namespace :admin do
    root to: 'home#index'
  end  
end
