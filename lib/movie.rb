
require 'date'

class Movie
	attr_reader :title, :genre, :date, :reviews

	def initialize(title, genre = "", date = "", reviews)
		@title = title
		@genre = genre
		@date = date
		@reviews = []
	
	end
	def <=>(other_movie)
		title <=> other_movie.title	
	end 
	#Se usa con el sort de la Linea 23
	def rating
		if reviews.any?
			ratings = reviews.map {|review| review.rating}
			total = ratings.reduce(0) {|total, rating| total += rating}
			total = review.reduce(0 {|total, review| total += review.rating})

		#return nil if reviews.empty?
		end
		#(reviews.map(&:rating).reduce(&:+).to_f / reviews.length).round(2)
		#llama a un array de metodo raiting de todos los review; (reduce el array a uno) 
	end
end


die_hard = Movie.new('Die hard', 'accion',Date.new(2001, 10, 2))
toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
clerks = Movie.new('Clerks', 'accion')
gladiator = Movie.new('Gladiator', 'drama')

cinema = Cinema.new([die_hard, toy, clerks, gladiator])
puts cinema.listing
puts
puts cinema.listing_by_genre('accion')
puts
puts cinema.listing_by_date
puts
cinema.listing_between_dates(Date.new(2004, 1, 1), Date.new(2013, 1, 1))




