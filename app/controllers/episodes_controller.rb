class EpisodesController < ApplicationController
  respond_to :html, :json
  before_filter :season, only:  [:index, :new, :create]
  
  def index
    @page_title = "Episodes"
    @episodes = @season.episodes
  end

  def show
    @episode = Episode.find(params[:id])
    @page_title = "Episode #{@episode.number}"
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

  def create
    if episode.save
      redirect_to action: "index", notice: "Episode created!"
    else
      render action: "new"
    end
  end
  
  def destroy
    episode = Season.episodes.find(params[:id])
    episode.destroy
    redirect_to season_episodes_url(@season)
  end
  
  protected
    
    def season
      @season = Season.find(params[:season_id])
    end
    
    def episode
      @episode ||= @season.episodes.build(params[:episode])
    end   
    helper_method :episode
end
