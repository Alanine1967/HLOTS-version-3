class SeasonsController < ApplicationController
  respond_to :html, :json
  
  def index
    @seasons = Season.all
    @page_title = "Seasons"
  end

  def edit
    @season = Season.find(params[:id])
    @page_title = "Season #{@season.number}"
  end
  
  def update
    season = Season.find(params[:id])
    if season.update_attributes(params[:season])
      redirect_to seasons_url, notice: "Season successfully updated!"
    else
      respond_with(render action: "edit")
    end
  end
  
  def new
    @page_title = "Seasons"
  end

  def create
    if season.save
      flash[:notice] = "The season was saved successfully"
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end
  
  def destroy
    season = Season.find(params[:id])
    season.destroy
    redirect_to seasons_url
  end
  
  protected
    
    def season
      @season ||= Season.new(params[:season])
    end
    
    helper_method :season
end
