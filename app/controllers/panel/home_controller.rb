module Panel
  class HomeController < Panel::ApplicationController
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
        redirect_to panel_root_path, notice: 'Perfil alterado com sucesso!'
      else
        render 'profile'
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def remove_password_key
      return unless params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
