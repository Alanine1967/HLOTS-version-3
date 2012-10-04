class SeasonsController < ApplicationController
  def index
    @title = "Seasons"
    @seasons = Season.find(:all)
  end

  def show
  end

  def edit
  end
  
  def update
  end

  def new
  end
  
  def create
  end
  
  def delete
  end
end
