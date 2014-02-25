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
end