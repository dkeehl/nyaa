class TorrentsController < ApplicationController

  def index
    @torrents = Torrent.paginate(page: params[:page])
  end

  def show
    @torrent = Torrent.find_by(id: params[:id])
    redirect_to root_path unless @torrent
  end

  def new
  end

  def create
  end

end
