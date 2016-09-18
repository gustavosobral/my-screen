class Admin::UsersController < Admin::ApplicationController
  add_breadcrumb 'Usuários', :admin_users_path

  def index
    @users = User.where(admin: false).page(params[:page]).per(15)
  end

  def new
    add_breadcrumb 'Novo'
    @user = User.new
  end

  def edit
    add_breadcrumb 'Editar'
    @user = set_user
  end

  def create
    add_breadcrumb 'Novo'
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Usuário salvo com sucesso!'
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Editar'
    remove_password_key
    @user = set_user
    if @user.update(user_params)
      flash[:notice] = 'Usuário alterado com sucesso!'
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = set_user
    @user.destroy
    flash[:notice] = 'Usuário excluído com sucesso!'
    redirect_to admin_users_path
  end

  private

    def set_user
      User.find_by(admin: false, id: params[:id])
    end

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
