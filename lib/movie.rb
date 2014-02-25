
require 'date'

class Movie
	attr_reader :title, :genre, :date

	def initialize(title, genre = "", date = "")
		@title = title
		@genre = genre
		@date = date
	
	end
	def <=>(other_movie)
		title <=> other_movie.title	
	end 
	#Se usa con el sort de la Linea 23
end

class Cinema
	def initialize(movies = [])
		#Si creo un cine si no le paso el array me lo crea por defecto
		@movies = movies

	end

	def listing 
		@movies.map {|movies| movies.title}.sort
		#@movies.map { |movie| movie.title }.sort Lo ORDENA alfabeticamente
		#@movies.sort_by{|movie| movie.title}.map{ |movie| movie.title}
		#@movies.sort_by{|&:title| movie.title}.map{ |movie| movie.title}
		#@movies.sort.map{ |movie| moive.title} Este metodo es para la Linea 7 a la 9
	end

	def listing_by_genre(genre)
		movies_by_genre = @movies.select do |movies|
			movies.genre == genre
		end
		#movies_by_genre.sort.map(&:title)
		#movies_by_genre.sort.map{|movie| movie.title}
		movies_by_genre.map{|movie| movie.title}.sort
	end

	def listing_by_date
		movies_by_date = @movies.select do |movies|
			movies.date != ""
		end
		#movies_by_genre.sort.map(&:title)
		#movies_by_genre.sort.map{|movie| movie.title}
		movies_by_date.map{|movie| movie.date}.sort
	end

	def group_by_genre
		@movies.inject({}) do |movies_by_genre, movie|
			movies_by_genre[movie.genre] ||= []
			movies_by_genre[movie.genre] << movie.title
			movies_by_genre
		end
	end

	def group_per_genre
		@movies.inject({}) do |movies_per_genre, movie|
			movies_per_genre[movie.genre] ||= 0
			movies_per_genre[movie.genre] += 1
			movies_per_genre
		end
	end
	
=begin
El metodo de arriba lo que pasa que aqui abajo esta extendido para visualizarlo
		@movies.reduce({}) do |hash, movie|
			if hash [movie.genre] == nil #hash (se puede sustituir el nombre) es como un diccionario con key & value
			  hash[movie.genre] = []
			  hash[movie.genre].push(movie.title)
			else
			hash[movie.genre].push(movie.title)
			end
			hash
	end	 
=end
=begin
Aqui lo que se hace en nombrar el hash por defecto
		@movies.inject(Hash.new([])) do |movies_by_genre, movie|
			movies_by_genre[movie.genre] << movie.title
			movies_by_genre
		end
=end


	def listing_between_dates(date_ini, date_end)
		movies_by_date = @movies.select do |movies|
			movies.date != ""
		end
		
		#movies_by_date.select! {|movies| movies.date >= date_ini && movies.date <= date_end}
		movies_by_date.select! {|movies| movies.date.between?(date_ini, date_end)}		
		movies_by_date.each {|movies| puts movies.date}
	end

	def add (movies)
		@movies.push(movies)
		#@movies << movie
	end

	def remove(movie_to_remove)
		@movies.delete_if do |movie|
			movie.title == movie_to_remove.title
		end
		#@movies.delete(movie_to_delete)
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




