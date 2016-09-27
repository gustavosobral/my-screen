module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :verify_admin

    add_breadcrumb 'Painel', :admin_root_path

    private

    def verify_admin
      unless current_user.admin?
        flash[:error] = 'Você <strong>não</strong> possui permissão para realizar esta ação.'
        redirect_to root_path
      end
    end
  end
end
