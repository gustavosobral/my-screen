module Panel
  class VideosController < Panel::ApplicationController
    add_breadcrumb 'Vídeos', :panel_videos_path

    def index
      @videos = current_user.videos.page(params[:page])
    end

    def new
      add_breadcrumb 'Novo'
      @video = current_user.videos.new
    end

    def edit
      add_breadcrumb 'Editar'
      @video = set_video
    end

    def create
      add_breadcrumb 'Novo'
      @video = current_user.videos.new(video_params)

      if @video.save
        flash[:notice] = 'Vídeo salvo com sucesso!'
        redirect_to panel_videos_path
      else
        render 'new'
      end
    end

    def update
      add_breadcrumb 'Editar'
      @video = set_video

      if @video.update(video_params)
        flash[:notice] = 'Vídeo alterado com sucesso!'
        redirect_to panel_videos_path
      else
        render 'edit'
      end
    end

    def destroy
      @video = set_video
      @video.destroy
      flash[:notice] = 'Vídeo excluído com sucesso!'
      redirect_to panel_videos_path
    end

    private

    def set_video
      current_user.videos.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :description, :file)
    end
  end
end
