class SeasonsController < ApplicationController
  respond_to :html, :json
  
  def index
    @page_title = "Seasons"
    @seasons = Season.all
  end

  def edit
    @season = Season.find(params[:id])
    @page_title = "Season #{@season.number}"
  end
  
  def update
    season = Season.find(params[:id])
    if season.update_attributes(params[:season])
      redirect_to seasons_path, notice: "Season successfully updated!"
    else
      respond_with(render action: "edit")
    end
  end

  def create
    if season.save
      flash[:notice] = "The season was saved successfully"
      redirect_to action: "index"
    else
      render action: "new"
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
