require 'spec_helper'

describe SeasonsController do
  
  before(:each) do
    @season_test = FactoryGirl.create(:season)
    @attr = FactoryGirl.attributes_for(:season)
  end
  
  describe "GET index" do
    it "should render index" do
      get :index
      response.should render_template :index
    end
    it "should set @page_title" do
      get :index
      assigns(:page_title).should eq("Seasons")
    end
  end
     
  describe "GET edit" do
    it "should render edit" do
      get :edit, id: @season_test
      response.should render_template :edit
    end
    it "should set @page_title" do
      get :edit, id: @season_test
      assigns(:page_title).should eq("Season #{@season_test.number}")
    end
  end
 
  describe "PUT update" do
    it "should redirect to index" do
      put :update, @attr
      response.should redirect_to seasons_url
    end
  end
   
  describe "GET new" do
    it "should render new" do
      get :new
      response.should render_template :new
    end
    it "should set @page_title" do
      get :new
      assigns(:page_title).should eq("Seasons")
    end
  end
 
  describe "POST create" do
    it "should save @season" do
      expect { post :create, season: @attr }.to change(Season, :count).by(1)
    end
  end
end
