module Admin
  class HomeController < Admin::ApplicationController

    def index
    end

    def profile
      add_breadcrumb 'Perfil'
      @user = current_user
    end

    def update_profile
      add_breadcrumb 'Perfil'
      remove_password_key
      @user = current_user
      if @user.update(user_params)
        flash[:notice] = 'Perfil alterado com sucesso!'
        redirect_to admin_root_path
      else
        render 'profile'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def remove_password_key
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
  end
end
