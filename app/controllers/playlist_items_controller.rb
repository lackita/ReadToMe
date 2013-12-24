class PlaylistItemsController < ApplicationController
  def create
    @playlist_item = PlaylistItem.new(:playlist_id => params[:playlist_id],
                                      :chapter_id => params[:chapter_id])
    @playlist_item.save
  end

  def destroy
    @playlist_item = PlaylistItem.find(params[:id])
    @playlist_item.destroy

    respond_to do |format|
      format.html { redirect_to @playlist_item.playlist }
      format.js
    end
  end
end
