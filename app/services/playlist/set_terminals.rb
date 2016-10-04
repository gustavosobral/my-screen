class Playlist::SetTerminals
  def initialize(playlist, params)
    @playlist = playlist
    @params = params
  end

  def set
    return unless params[:playlist][:terminals]
    add_terminals
  end

  private

  attr_accessor :playlist, :params

  def add_terminal(id)
    playlist.terminals << Terminal.find(id)
  end

  def add_terminals
    params[:playlist][:terminals].each { |id| add_terminal(id) }
  end
end
