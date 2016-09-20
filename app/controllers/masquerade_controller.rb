class MasqueradeController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_masquerade!

  def switch_user
    user = User.find_by(admin: false, id: params[:id])
    session[:original_user_id] = current_user.id
    bypass_sign_in(user)
    flash[:warning] = "Você está visualizando o painel como #{user.name} (#{user.email})."
    redirect_to panel_root_path
  end

  def switch_back
    user = User.find(session[:original_user_id])
    session[:original_user_id] = nil
    bypass_sign_in(user)
    flash[:notice] = 'Você voltou ao painel administrativo.'
    redirect_to admin_users_path
  end

  private

    def authorize_masquerade!
      user = session[:original_user_id] ? User.find(session[:original_user_id]) : current_user
      unless user.admin?
        flash[:error] = 'Você não possui permissão para realizar esta ação.'
        redirect_to root_path
      end
    end
end
