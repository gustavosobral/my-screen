class Admin::UsersController < Admin::ApplicationController
  add_breadcrumb 'Usuários', :admin_users_path

  def index
    @users = User.where(admin: false).page(params[:page])
  end

  def new
    add_breadcrumb 'Novo'
    @user = User.new
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

  def edit
    add_breadcrumb 'Editar'
  end

  def destroy
    @user = set_user
    @user.destroy
    flash[:notice] = 'Usuário excluído com sucesso!'
    redirect_to admin_users_path
  end

  private

    def set_user
      User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
