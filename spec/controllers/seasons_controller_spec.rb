require 'spec_helper'

describe SeasonsController do
  render_views
  
  before(:each) do
    @base_title = "Homicide Life on the Street"
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "should display the correct title" do
      get 'index'
      response.should have_selector("title",
                                    content: @base_title + " | Seasons")
    end
  end

  context "GET 'show'" do
    it "should display the correct title" do
      pending "get 'show'"
      response.should have_selector("title",
                                    content: @base_title + " | Seasons")
    end
  end

  describe "GET 'edit'" do
    it "should display the correct title" do
      pending "get 'edit'"
      response.should have_selector("title",
                                    content: @base_title + " | Seasons")
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    it "should display the correct title" do
      pending "get 'new'"
      response.should have_selector("title",
                                    content: @base_title + " | Seasons")
    end
  end

end
