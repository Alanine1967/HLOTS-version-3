require 'spec_helper'

describe SeasonsController do
  
  describe "GET index" do
    let(:season) { FactoryGirl.create(:season) }
    before(:each) { get :index }
    it("renders") { response.should render_template 'index' }
    it("assigns @seasons") { assigns(:season).should == @seasons }
  end
     

  describe "Edit" do
    let(:season) { FactoryGirl.create(:season) }
    before(:each) { get :edit, id: season.id }
    it("renders") { response.should render_template :edit }
    it("assigns @season") { assigns(:season).should == @season }
  end

  describe "Delete" do
    let(:season) { FactoryGirl.create(:season) }
    before(:each) { get :delete, id: season.id }
    it("renders") { response.should redirect_to season_url }
    it("assigns @season") { assigns(:season).should == @season }
  end
  
  describe "PUT update" do
    it "should update season attribute" do
      @season.update_attributes(number: 99)
      response.should be_success
    end
  end
 
  describe "POST create" do
    before(:each) do
      @attr = FactoryGirl.attributes_for(:season)
    end
    context "with valid attributes" do
      it "creates a new season" do
        expect { post :create, season: @attr
          }.to change(Season, :count).by(1)
      end
      
      it "sets a flash[:notice] message" do
        post :create, season: @attr
        flash[:notice].should eq("The season was saved successfully")
      end
      
      it "redirects to the season index" do
        post :create, season: @attr
        response.should redirect_to(action: "index")
      end
    end
    context "when the season fails to save" do
      before(:each) do
        @attr = FactoryGirl.attributes_for(:invalid_season)
      end
      it "does not save the new contact" do
        expect { post :create, season: @attr
          }.to_not change(Season, :count)
      end
      it "re-renders the new method" do
        post :create, season: @attr
        response.should render_template :new
      end
    end
  end
end
