module ApplicationHelper
  def current_playlist
    session[:playlist] or Playlist.last
  end
end
