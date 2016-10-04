module Panel
  class PlaylistsController < Panel::ApplicationController
    add_breadcrumb 'Playlists', :panel_playlists_path

    def index
      @playlists = current_user.playlists.page(params[:page]).per(15)
    end

    def new
      add_breadcrumb 'Nova'
      @playlist = current_user.playlists.new
      @resources = set_resources
    end

    def edit
      add_breadcrumb 'Editar'
      @playlist = set_playlist
      @resources = set_resources
    end

    def create
      @playlist = current_user.playlists.new(playlist_params)
      Playlist::SetItems.new(@playlist, params).set
      Playlist::SetTerminals.new(@playlist, params).set

      if @playlist.save
        redirect_to panel_playlists_path, notice: 'Playlist salva com sucesso!'
      else
        @resources = set_resources
        render 'new'
      end
    end

    def update
      @playlist = set_playlist
      Playlist::SetItems.new(@playlist, params).set
      Playlist::SetTerminals.new(@playlist, params).set

      if @playlist.update(playlist_params)
        redirect_to panel_playlists_path, notice: 'Playlist alterada com sucesso!'
      else
        @resources = set_resources
        render 'edit'
      end
    end

    def destroy
      @playlist = set_playlist
      @playlist.destroy
      redirect_to panel_playlists_path, notice: 'Playlist excluída com sucesso!'
    end

    private

    def set_playlist
      current_user.playlists.find(params[:id])
    end

    def set_resources
      (current_user.videos + current_user.images).shuffle
    end

    def playlist_params
      params.require(:playlist).permit(:title, :description, :duration)
    end
  end
end
