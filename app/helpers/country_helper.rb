module CountryHelper
	def get_stars(id)
		comments = Comment.where(hotel_id: id)
		totalStars = comments.sum/comments.count
		
		return totalStars
	end
end
