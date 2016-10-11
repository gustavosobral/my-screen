class Playlist::SetItems
  def initialize(playlist, params)
    @playlist = playlist
    @params = params
  end

  def set
    clear_playlist
    return unless params[:playlist][:playlist_items]
    items = create_items
    add_playlist_items(items)
  end

  private

  attr_reader :playlist, :params

  def clear_playlist
    playlist.playlist_items.clear
    playlist.duration = 0.0
  end

  def zip_params
    params[:playlist][:playlist_items][:id].zip params[:playlist][:playlist_items][:duration]
  end

  Item = Struct.new(:id, :duration)
  def create_items
    zip_params.map do |id, duration|
      Item.new(id, duration.to_f.round(1))
    end
  end

  def add_playlist_item(item, index)
    playlist.playlist_items << Resource.find(item.id).playlist_items.new(position: index,
                                                                         duration: item.duration)
  end

  def add_playlist_items(items)
    items.each_with_index do |item, index|
      add_playlist_item(item, index)
      playlist.duration += item.duration
    end
  end
end
