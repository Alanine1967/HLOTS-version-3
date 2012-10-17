require 'spec_helper'

describe ParticipantsController do
  before(:each) do
    @episode = Episode.make!
    @participant = Participant.make!
    @attr = FactoryGirl.attributes_for(:participant)
  end

  describe "GET 'new'" do
    it "should render view" do
      get :new, episode_id: @participant
      response.should render_template :new
    end
    it "should set @page_title" do
      get :new, episode_id: @participant
      assigns(:page_title).should 
                          eq("Episode #{@episode.number} - Cast & Crew")
    end
  end

  describe "POST create" do
    it "should save participant" do
      expect { post :create, episode_id: @episode,
                participant: @attr }.to change(Participant, :count).by(1)
    end
  end

  describe "GET 'edit'" do
    it "should render edit" do
      get :edit, id: @participant
      response.should render_template :edit
    end
    it "should set @page_title" do
      get :edit, id: @participant
      assigns(:page_title).should 
                          eq("Edit Cast & Crew")
    end
  end

  describe "POST 'update'" do
    it "should redirect to episodes#show" do
      put :update, id: @participant
      response.should render_template @episode
    end
  end

  describe "GET 'show'" do
    it "should render show" do
      get :show, id: @participant
      response.should render_template :show
    end
    it "should set @page_title" do
      get :show, id: @participant
      assigns(:page_title).should eq("Cast & Crew")
    end
  end

  describe "DELETE 'destroy'" do
    it "should delete the episode" do
      session[:episode_id] = @participant.id
      expect { delete :destroy, id: @participant }.to change(Participant, :count).by(-1)
    end
  end

end
