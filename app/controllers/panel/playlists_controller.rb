class Panel::PlaylistsController < Panel::ApplicationController
  add_breadcrumb 'Playlists', :panel_playlists_path

  def index
    @playlists = current_user.playlists.page(params[:page]).per(15)
  end
end
