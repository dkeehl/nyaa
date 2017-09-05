class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.paginate(page: params[:page])
  end

end
