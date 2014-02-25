require 'rspec'
require_relative 'cinema'

describe Movie do 
	describe 'atributes' do
		let('movie') do
			Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
		end

		 it 'has a title' do 
		 	expect(movie.title).to eq('Die hard')
		end	

		it 'has a genre' do
		 	expect(movie.genre).to eq('accion')
		end

		it 'has a date' do
		 	expect(movie.date).to eq(Date.new(2001, 10, 2))
		end
	end
end

describe 'ordering' do
	it 'orders itself by its title' do
		toy = Movie.new('Toy', 'animacion', Date.new)
		clerks = Movie.new('Clerks', 'accion')

		ordered_movies = [toy, clerks].sort
		#en el fichero cinema.rb hay que descomentar la linea del comparativo <=>

		expect(ordered_movies.first).to eq(clerks)
		expect(ordered_movies.last).to eq(toy)
	end
end
	describe 'Cinema' do 
		describe 'adding movies to our cinema' do
			it 'adds a movie to our listing' do
				cinema = Cinema.new

				cinema.add(Movie.new('Toy','accion', Date.new))

				expect(cinema.listing).to include('Toy')
			end
		end

		describe 'removing movies to our cinema' do
			it 'removes a movie to our listing' do
				die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
				toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
					
				cinema = Cinema.new([die_hard, toy])

				cinema.remove(die_hard)

				expect(cinema.listing).to_not include('Die hard')
			end
		end
	end

	describe 'listing' do
		it 'returns an array with the title  of our movies' do
			die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
			clerks = Movie.new('Clerks', 'accion')

			cinema = Cinema.new([die_hard, toy, clerks])

			titles = cinema.listing
			expect(titles).to include('Die hard')
			expect(titles).to include('Toy')
			expect(titles).to include('Clerks')
		end
	

		it 'returns the movies ordered by title' do
			die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
			clerks = Movie.new('Clerks', 'accion')

			cinema = Cinema.new([die_hard, toy, clerks].sort)

			title_ordered = cinema.listing
			expect(title_ordered[1]).to eq('Die hard')
			expect(title_ordered[2]).to eq('Toy') 
			expect(title_ordered[0]).to eq('Clerks')
		end

		it 'returns the movies ordered by year' do
			die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))


			cinema = Cinema.new([die_hard, toy].sort)

			date_ordered = cinema.listing_by_date
			expect(date_ordered[0].to_s).to eq("2001-10-02")
			#Si se anade .to_s convierte el objeto en string
			expect(date_ordered[1]).to eq(Date.new(2012, 8, 2)) 
			#si anadimos Date.new toma el objeto tal y como tiene la fecha estructurada
		end

		it 'returns the movies ordered between years' do
			die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))

			cinema = Cinema.new ([die_hard, toy].sort)

			between_year_ordered = cinema.listing_between_dates(Date.new(2000, 1, 1), Date.new(2013, 1, 1))
			expect(between_year_ordered[1].date.to_s).to eq("2012-08-02")
		end
	end

	describe 'group_by_genre' do
		it 'group the movies of the cinema by genre' do	
			die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
			clerks = Movie.new('Clerks', 'accion')
			gladiator = Movie.new('Gladiator', 'drama')

			cinema = Cinema.new([die_hard, toy, clerks, gladiator])

			titles = cinema.group_by_genre

			expect(titles['accion']).to include('Die hard', 'Clerks')
			expect(titles['accion'].length).to eq(2)

			expect(titles['drama']).to eq(['Gladiator'])

		end
	end

	describe 'group_per_genre' do
		it 'group the movies of the cinema in genre' do	
			die_hard = Movie.new('Die hard', 'accion',Date.new(2001, 10, 2))
			toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))
			clerks = Movie.new('Clerks', 'accion')
			gladiator = Movie.new('Gladiator', 'drama')

			cinema = Cinema.new([die_hard, toy, clerks, gladiator])

			titles = cinema.group_per_genre

			expect(titles['accion']).to eq(2)
			expect(titles['drama']).to eq(1)
		end
	end


