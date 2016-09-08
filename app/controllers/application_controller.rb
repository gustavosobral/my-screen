class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  add_breadcrumb 'Painel', :admin_root_path

  private

    def after_sign_out_path_for(resource_or_scope)
      admin_root_path
    end
end
