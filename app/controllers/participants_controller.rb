class ParticipantsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  expose(:episodes)
  expose(:episode)
  expose(:participants)
  expose(:participant)

  def create
    if participant.save
      Role.create([episode_id: episode.id, participant_id: participant.id])
      redirect_to episode_url(episode), notice: "cast/crew created"
    else
      redirect_to action: "new", alert: "Create failed!"
    end
  end

  def update
    if participant.save
      redirect_to participant, notice: 'Successfully updated!'
    else
      redirect_to action:edit, alert: "Update failed!"
    end
  end

  def destroy
    participant.destroy
    redirect_to root_url, notice: "Deleted!"
  end
end
