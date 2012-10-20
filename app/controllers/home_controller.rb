class HomeController < ApplicationController
	respond_to :html, :xml, :json
	expose(:seasons)
end
