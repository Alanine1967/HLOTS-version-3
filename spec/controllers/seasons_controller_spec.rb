require 'spec_helper'

describe SeasonsController do
  
  before(:each) do
    @season = FactoryGirl.create(:season)
    @attr = FactoryGirl.attributes_for(:season)
  end
  
  describe "GET show" do
    it "should render show" do
      get :show, id: @season
      response.should render_template :show
    end
    it "should set @page_title" do
      get :show, id: @season
      assigns(:page_title).should eq("Season #{@season.number}")
    end
  end
  describe "GET edit" do
    it "should render edit" do
      get :edit, id: @season
      response.should render_template :edit
    end
    it "should set @page_title" do
      get :edit, id: @season
      assigns(:page_title).should eq("Season #{@season.number}")
    end
  end
 
  describe "PUT update" do
    it "should redirect to index" do
      put :update, id: @season
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
  
  describe "DELETE destroy" do
    it "should delete the season" do
      expect { delete :destroy, id: @season }.to change(Season, :count).by(-1)
    end
  end
end
