class Panel::VideosController < Panel::ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  add_breadcrumb 'Vídeos', :panel_videos_path

  def index
    @videos = Video.where(user: current_user).page(params[:page])
  end

  def new
    add_breadcrumb 'Novo'
    @video = Video.new
  end

  def edit
    add_breadcrumb 'Editar'
  end

  def create
    add_breadcrumb 'Novo'
    @video = Video.new(video_params)
    @video.user = current_user

    if @video.save
      flash[:notice] = 'Vídeo salvo com sucesso!'
      redirect_to panel_videos_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Editar'
    if @video.update(video_params)
      flash[:notice] = 'Vídeo alterado com sucesso!'
      redirect_to panel_videos_path
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    flash[:notice] = 'Vídeo excluído com sucesso!'
    redirect_to panel_videos_path
  end

  private

    def correct_user
      @video = Video.find_by(user: current_user, id: params[:id])
      if @video.nil?
        flash[:error] = 'Você não possui autorização para acessar esse recurso.'
        redirect_to panel_root_path
      end
    end

    def video_params
      params.require(:video).permit(:title, :description, :file)
    end
end
