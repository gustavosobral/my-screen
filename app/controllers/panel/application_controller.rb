module Panel
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!
    before_action :verify_admin

    rescue_from FFMPEG::Error,                with: :ffmpeg_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    add_breadcrumb 'Painel', :panel_root_path

    private

    def verify_admin
      if current_user.admin?
        flash[:error] = 'Você <strong>não</strong> possui permissão para realizar esta ação.'
        redirect_to root_path
      end
    end

    def ffmpeg_error
      flash[:error] = 'Ocorreu um erro no upload do arquivo. Por favor, verifique se a codificação do vídeo esta correta.'
      redirect_to panel_videos_path
    end

    def record_not_found
      flash[:error] = 'Você <strong>não</strong> possui autorização para acessar esse recurso.'
      redirect_to panel_root_path
    end
  end
end
