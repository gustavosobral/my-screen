class Panel::PlaylistsController < Panel::ApplicationController
  add_breadcrumb 'Playlists', :panel_playlists_path

  def index
    @playlists = current_user.playlists.page(params[:page]).per(15)
  end

  def new
    add_breadcrumb 'Nova'
    @playlist = current_user.playlists.new
  end

  def edit
    add_breadcrumb 'Editar'
    @playlist = set_playlist
  end

  def create
    redirect_to panel_playlists_path
  end

  def update
    redirect_to panel_playlists_path
  end

  def destroy
    @playlist = set_playlist
    @playlist.destroy
    flash[:notice] = 'Playlist excluída com sucesso!'
    redirect_to panel_playlists_path
  end

  private

    def set_playlist
      current_user.playlists.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :description, :duration)
    end
end
