namespace :terminals do
  task notify: :environment do
    channels = Pusher.get('/channels')[:channels].keys
    terminals_channels = channels.select { |ch| ch.include?('private-terminal') }
    terminals_ids = terminals_channels.collect { |ch| ch.gsub('private-terminal-', '') }
    terminals = Terminal.where(notified: false, id: terminals_ids)

    terminals.each do |terminal|
      unless terminal.playlist.nil?
        Pusher.trigger("private-terminal-#{terminal.id}", 'new_playlist', terminal.playlist.as_json )
      else
        Pusher.trigger("private-terminal-#{terminal.id}", 'new_playlist', { message: 'Default playlist' } )
      end
    end
  end
end
