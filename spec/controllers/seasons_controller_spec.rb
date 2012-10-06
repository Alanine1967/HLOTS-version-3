require 'spec_helper'

describe SeasonsController do
    
    before(:each) do
      @season = Season.create(number: 1, year: 1993)
    end
    
  describe "GET edit" do
    it "should be successful" do
      get :edit, id: @season
      response.should be_success
    end
  end
  
  describe "PUT update" do
    it "should update season attribute" do
      @season.update_attributes(number: 99)
      response.should be_success
    end
  end
  
  describe "DELETE 'destroy" do

    it "should destroy the season" do
      lambda do
        delete :destroy, id: @season
      end.should change(Season, :count).by(-1)
    end
  end
  describe "GET index" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end
  
  describe "POST create" do
    let(:season) { mock_model(Season).as_null_object }
    before do
      Season.stub(:new).and_return(season)
    end   
    it "creates a new season" do
      Season.should_receive(:new).
        with("number" => "1", "year" => "1991").
        and_return(season)
      post :create, :season => { "number" => "1", "year" => "1991" }
    end
    context "when the season saves successfully" do
      before do
        season.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The season was saved successfully")
      end
      
      it "redirects to the season index" do
        post :create
        response.should redirect_to(action: "index")
      end
    end
    context "when the season fails to save" do
      before do
        season.stub(:save).and_return(false)
      end
      
      it "assigns @season" do
        post :create
        assigns[:season].should eq(season)
      end
      
      it "renders the new template" do
        post :create
        response.should render_template("new")
      end
    end
  end
end
