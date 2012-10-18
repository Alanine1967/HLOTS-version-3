module SeasonsHelper
	def page_title
		page_title = @season ? "Season #{@season.number}" : "Seasons"
	end
end
