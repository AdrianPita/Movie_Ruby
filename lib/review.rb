

class reviews
	attr_reader :title, :text, :rating

	def initialize (title, text, rating)
		@title = title
		@text = text
		@rating = rating
	end
end