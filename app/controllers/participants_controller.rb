class ParticipantsController < ApplicationController
  respond_to :html, :json
  before_filter :episode, only: [:index, :new, :create]
  
  def index
    @page_title = "Cast & Crew"
  end

  def new
    @participant = @episode.participants.new(params[:participant])
    @page_title = "Episode #{@episode.number} - Cast & Crew"
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
    @participant = Participant.find(params[:id])
    @page_title = "Edit Cast & Crew"
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(params[:participant])
      redirect_to @participant, notice: 'Successfully updated!'
    else
      render action:edit
    end
  end

  def show
    @participant = Participant.find(params[:id])
    @page_title = "Cast & Crew"
  end

  def destroy
    participant = Participant.find(params[:id])
    participant.destroy
    redirect_to episode_url(session[:episode_id])
  end
  
  protected
    def episode
      @episode = Episode.find(params[:episode_id])
    end
end
