class ParticipantsController < ApplicationController
  respond_to :html, :json
  before_filter :episode, only: [:index, :new, :create]
  
  def index
    @page_title = "Cast & Crew"
  end

  def new
    @participant = @episode.participants.new(params[:participant])
    @page_title = "Cast & Crew"
  end

  def create
    @participant = @episode.participants.new(params[:participant])
    if @participant.save
      Role.create(episode_id: @episode.id, participant_id: @participant.id)
      redirect_to episode_path(@episode), notice: "cast/crew created"
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  protected
    def episode
      @episode = Episode.find(params[:episode_id])
    end
end
