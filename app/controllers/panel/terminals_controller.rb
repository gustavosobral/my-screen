module Panel
  class TerminalsController < Panel::ApplicationController
    add_breadcrumb 'Terminais', :panel_terminals_path

    def index
      @terminals = current_user.terminals.orderly.page(params[:page])
    end

    def edit
      add_breadcrumb 'Editar'
      @terminal = set_terminal
    end

    def update
      add_breadcrumb 'Editar'
      remove_password_key
      @terminal = set_terminal
      if @terminal.update(terminals_params)
        redirect_to panel_terminals_path, notice: 'Terminal alterado com sucesso!'
      else
        render 'edit'
      end
    end

    private

    def set_terminal
      current_user.terminals.find(params[:id])
    end

    def terminals_params
      params.require(:terminal).permit(:playlist_id, :title,
                                       :password, :password_confirmation)
    end

    def remove_password_key
      return unless params[:terminal][:password].blank?
      params[:terminal].delete(:password)
      params[:terminal].delete(:password_confirmation)
    end
  end
end
