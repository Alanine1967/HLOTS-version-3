class SeasonsController < ApplicationController
  before_filter :authenticate_user!, except: :show
  expose(:seasons)
  expose(:season)
  expose(:episodes)

  def update
    if season.save
      redirect_to root_url, notice: "Season successfully updated!"
    else
      redirect_to action: "edit", alert: "Edit failed!"
    end
  end
  
  def create
    if season.save
      redirect_to root_url, notice: "Season #{season.number} created!"
    else
      redirect_to action: "new", alert: "Season create failed!"
    end
  end
  
  def destroy
    season.destroy
    redirect_to root_url, notice: "Season deleted!"
  end
end