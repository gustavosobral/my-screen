class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :verify_admin

  add_breadcrumb 'Painel', :admin_root_path

  private

    def verify_admin
      unless current_user.admin?
        flash[:error] = 'Você não possuí permissão de administrador'
        redirect_to panel_root_path
      end
    end
end
