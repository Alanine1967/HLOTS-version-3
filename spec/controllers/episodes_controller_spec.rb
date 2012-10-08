require 'spec_helper'

describe EpisodesController do

  describe "GET 'index'" do
    it "returns http success" do
      pending
      get :index, season_id: 5
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before(:each) do
      @episode = FactoryGirl.create(:episode)
    end
    it "assigns the requested episode to @episode" do
      get :show, id: @episode
      assigns(:episode).should eq(@episode)
    end
    it "renders the show view" do
      get :show, id: @episode
      response.should render_template :show
    end
  end
  
  describe "POST update" do
    before(:each) do
      @episode = FactoryGirl.create(:episode)
    end
    context "valid attributes" do
      it "locates the requested episode" do
        put :update, id: @episode, 
                          episode: FactoryGirl.attributes_for(:episode)
        assigns(:episode).should eq(@episode)
      end
      it "changes the episodes attributes" do
        put :update, id: @episode, 
                        episode: FactoryGirl.attributes_for(:episode, 
                        number: 560, title: "new title")
        @episode.reload
        @episode.number.should eq(560)
        @episode.title.should eq("new title")
      end
      it "redirects to the updated episode" do
        put :update, id: @episode, 
                        episode: FactoryGirl.attributes_for(:episode)
        response.should redirect_to @episode
      end
    end
    context "invalid attributes" do
            it "locates the requested episode" do
        put :update, id: @episode, 
                        episode: FactoryGirl.attributes_for(:invalid_episode)
        assigns(:episode).should eq(@episode)
      end
      it "changes the episodes attributes" do
        put :update, id: @episode, 
                        episode: FactoryGirl.attributes_for(:episode, 
                        number: 560, title: nil)
        @episode.reload
        @episode.number.should eq(560)
        @episode.title.should eq("new title")
      end
      it "re-renders the edit method" do
        put :update, id: @episode, 
                        episode: FactoryGirl.attributes_for(:invalid_episode)
        response.should render_template :edit
      end
    end
  end
  
  describe "POST create" do
    before(:each) do
      @episode = FactoryGirl.build(:episode)
      @attr = FactoryGirl.attributes_for(:episode)
    end
    context "with valid attributes" do
      it "creates a new episode" do
        pending
        expect {
          post :create, id: @episode.season_id, episode: @attr
        }.to change(Episode, :count).by(1)
      end
    end
      
    context "when the episode saves successfully" do

      it "sets a flash[:notice] message" do
        pending("sort creates") do
          post :create, season_id: @season
          flash[:success].should eq("Episode created!")
        end
      end
    
      it "redirects to the episode index" do
        pending
        post :create, season_id: @season.id
        response.should redirect_to(action: "index")
      end
    end
  end
  
  describe "DELETE destroy" do
  end

end
