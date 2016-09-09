class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from FFMPEG::Error, with: :ffmpeg_error

  add_breadcrumb 'Painel', :admin_root_path

  private

    def ffmpeg_error
      flash[:error] = 'Ocorreu um erro no upload do arquivo. Por favor, verifique se a codificação do vídeo esta correta'
      redirect_to admin_videos_path
    end
end