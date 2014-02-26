

class Review
	attr_reader :title, :comments, :rating

	def initialize (title, comments, rating)
		@title = title
		@comments = []
		@rating = rating
	end

	def delete_comments
        @comments = []
    end

    def add_comment(comment)
        @comments = comment
    end
end