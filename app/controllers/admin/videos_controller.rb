class Admin::VideosController < ApplicationController
  add_breadcrumb 'Vídeos', :admin_videos_path

  def index
    @videos = Video.page(params[:page])
  end

  def show
    @video = set_video
  end

  def new
    add_breadcrumb 'Novo'
    @video = Video.new
  end

  def create
    add_breadcrumb 'Novo'
    @video = Video.new(video_params)

    if @video.save
      flash[:notice] = 'Vídeo salvo com sucesso!'
      redirect_to admin_videos_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Editar'
    @video = set_video
    if @video.update(video_params)
      flash[:notice] = 'Vídeo alterado com sucesso!'
      redirect_to admin_videos_path
    else
      render 'edit'
    end
  end

  def edit
    add_breadcrumb 'Editar'
    @video = set_video
  end

  def destroy
    @video = set_video
    @video.destroy if @video.present?
    redirect_to admin_videos_path
  end

  private
    def set_video
      Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :description, :file)
    end
end
