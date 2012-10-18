class EpisodesController < ApplicationController
  before_filter :authenticate_user!, except: :show
  expose(:season)
  expose(:episode)

  def update
    if episode.save
      redirect_to season_url(session[:season_id]), notice: 'Episode updated!'
    else
      redirect_to action: :edit, alert: "update failed!"
    end
  end

  def create
    if episode.save
      redirect_to season_url(session[:season_id]), notice: "Episode created!"
    else
      redirect_to action: :new, alert: "Episode create failed!"
    end
  end

  def destroy
    episode.destroy
    redirect_to season_url(session[:season_id]), notice: "Destroyed!"
  end
end