class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new(song_params)
  end
  
  def create
    @song = Song.new(song_params)       
    if @song.valid?
      @song.saved
      redirect_to song_path(@song)
    else
      render :new 
    end
  end
  
  def show
    @song = Song.find(params[:id])
  end
  
  def edit 
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit 
    end
  end
    
  private
  
  def song_params
   params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
  end
    
end
