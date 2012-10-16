require 'spec_helper'

describe EpisodesController do
  before(:each) do
    @episode = Episode.make!
    @attr = FactoryGirl.attributes_for(:episode)
  end

  describe "GET 'index'" do
    it "should render index" do
      get :index, season_id: @episode
      response.should render_template :index
    end
  end

  describe "GET 'show'" do
    it "should render show" do
      get :show, id: @episode
      response.should render_template :show
    end
    it "should set @page_title" do
      get :show, id: @episode
      assigns(:page_title).should eq("Episode #{@episode.number}")
    end
  end
  
  describe "GET edit" do
    it "should render edit" do
      get :edit, id: @episode
      response.should render_template :edit
    end
    it "should set @page_title" do
      get :edit, id: @episode
      assigns(:page_title).should eq("Episode #{@episode.number}")
    end
  end
  
  describe "POST update" do
    it "should redirect to index" do
      put :update, id: @episode
      response.should redirect_to episode_url
    end
  end
  
  describe "GET new" do
    it "should render view" do
      get :new, season_id: @episode
      response.should render_template :new
    end
    it "should set @page_title" do
      pending
      get :new, season_id: @episode
      assigns(:page_title).should eq("Episode #{@episode.number}")
    end
  end
  
  describe "POST create" do
    it "should save episode" do
      pending
      expect { post :create, season_id: @attr }.to change(Episode, :count).by(1)
    end
    it "should redirect to index" do
      pending
      post :create, season_id: @episode
      response.should render_template :index
    end
  end
end
