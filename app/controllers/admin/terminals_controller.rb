class Admin::TerminalsController < Admin::ApplicationController
  add_breadcrumb 'Terminais', :admin_terminals_path

  def index
    @terminals = Terminal.page(params[:page]).per(15)
  end

  def new
    add_breadcrumb 'Novo'
    @terminal = Terminal.new
  end

  def edit
    add_breadcrumb 'Editar'
    @terminal = set_terminal
  end

  def create
    add_breadcrumb 'Novo'
    @user = User.find(params[:terminal][:user_id])
    @terminal = @user.terminals.new(terminals_params)

    if @terminal.save
      flash[:notice] = 'Terminal salvo com sucesso!'
      redirect_to admin_terminals_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Editar'
    @terminal = set_terminal
    if @terminal.update(terminals_params)
      flash[:notice] = 'Terminal alterado com sucesso!'
      redirect_to admin_terminals_path
    else
      render 'edit'
    end
  end

  def destroy
    @terminal = set_terminal
    @terminal.destroy
    flash[:notice] = 'Terminal excluído com sucesso!'
    redirect_to admin_terminals_path
  end

  private

    def set_terminal
      Terminal.find(params[:id])
    end

    def terminals_params
      params.require(:terminal).permit(:user_id, :title)
    end
end
