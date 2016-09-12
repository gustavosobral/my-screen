class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :verify_admin

  add_breadcrumb 'Painel', :admin_root_path

  private

    def verify_admin
      unless current_user.admin?
        flash[:error] = 'Você não possui permissão para realizar esta ação.'
        redirect_to root_path
      end
    end
end
