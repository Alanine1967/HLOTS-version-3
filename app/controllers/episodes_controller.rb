class EpisodesController < ApplicationController
  respond_to :html, :json
  before_filter :season, only:  [:index, :new, :create]
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @page_title = "Season #{@season.number}"
    @episodes = @season.episodes
  end

  def show
    @episode = Episode.find(params[:id])
    @page_title = "Episode #{@episode.number}"
    @cast = []
    @crew = []
    @episode.participants.each do |participant|
      if participant.cast
        @cast << participant
      else
        @crew << participant
      end
    end
  end
  
  def edit
    @episode = Episode.find(params[:id])
    @page_title = "Episode #{@episode.number}"
  end
  
  def update
    @episode = Episode.find(params[:id])
    if @episode.update_attributes(params[:episode])
      redirect_to @episode, notice: 'Episode was successfully updated'
    else
      render action: "edit"
    end
  end
  
  def new
    @episode = @season.episodes.new(params[:episode])
    @page_title = "Season #{@season.number}"
  end
  
  def create
    @episode = @season.episodes.new(params[:episode])
    if @episode.save
      redirect_to action: "index", notice: "Episode created!"
    else
      render action: "new"
    end
  end
  
  def destroy
    episode = Episode.find(params[:id])
    episode.destroy
    redirect_to season_episodes_url(params[:episode])
  end
  
  protected
    
    def season
      @season = Season.find(params[:season_id])
    end
end
