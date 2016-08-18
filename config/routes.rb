Rails.application.routes.draw do
  scope '/admin' do
    devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  end

  namespace :admin do
    root to: 'home#index'
  end  
end
