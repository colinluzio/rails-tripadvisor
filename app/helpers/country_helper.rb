module CountryHelper
	def get_stars(id)
		comments = Comment.where(hotel_id: id)
		if comments.count() == nil || comments.count() == 0
			return 'no ratings yet'
		else
			totalStars = comments.sum(:stars)/comments.count()
			return totalStars
		end
		
	end
end
