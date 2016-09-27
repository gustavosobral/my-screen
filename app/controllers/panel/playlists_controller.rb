class Panel::PlaylistsController < Panel::ApplicationController
  add_breadcrumb 'Playlists', :panel_playlists_path

  def index
    @playlists = current_user.playlists.page(params[:page]).per(15)
  end

  def new
    add_breadcrumb 'Nova'
    @playlist = current_user.playlists.new
    @resources = (current_user.videos + current_user.images).shuffle
  end

  def edit
    add_breadcrumb 'Editar'
    @playlist = set_playlist
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    create_playlist_items @playlist
    set_terminals @playlist

    if @playlist.save
      flash[:notice] = 'Playlist salva com sucesso!'
      redirect_to panel_playlists_path
    else
      @resources = (current_user.videos + current_user.images).shuffle
      render 'new'
    end
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

    def create_playlist_items(playlist)
      playlist.duration = 0.0
      if params[:playlist][:playlist_items]
        params[:playlist][:playlist_items][:id].zip(params[:playlist][:playlist_items][:duration]).each_with_index do |subarray, index|
          playlist.playlist_items << Resource.find(subarray[0]).playlist_items.new(position: index, duration: subarray[1].to_f.round(1))
          playlist.duration += subarray[1].to_f
        end
      end
    end

    def set_terminals(playlist)
      if params[:playlist][:terminals]
        params[:playlist][:terminals].each do |id|
          playlist.terminals << Terminal.find(id)
        end
      end
    end

    def playlist_params
      params.require(:playlist).permit(:title, :description, :duration)
    end
end
