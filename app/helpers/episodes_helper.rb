module EpisodesHelper
	def page_title
		page_title = @episode ? "Episode #{@episode.number}" : "Episodes"
	end

	def actors
		actors = []
		episode.participants.each do	|participant|
			actors << participant if participant.cast
		end
		actors
	end

	def artisans
		artisans = []
		episode.participants.each do |participant|
			artisans << participant unless participant.cast
		end
		artisans
	end

	def full_name(hash)
		full_name = ""
		full_name << "#{hash[:first_name]} " unless hash.first_name.empty?
		full_name << "#{hash[:middle_name]} " unless hash.middle_name.empty?
		full_name << "#{hash[:surname]}"
	end
end
