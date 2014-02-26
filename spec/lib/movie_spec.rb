require 'spec_helper'
require 'movie'
require 'cinema'
require 'review'
describe Movie do 
	describe 'atributes' do
		let(:movie) do
			Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
		end

		 it 'has a title' do 
		 	expect(movie.title).to eq('Die hard')
		end	

		it 'has a genre' do
		 	expect(movie.genre).to eq('accion')
		end
=begin
		it 'has a date' do
		 	expect(movie.date).to eq(Date.new(2001, 10, 2))
		end
=end
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

	describe 'movies review' do 
		let(:movie) do
			Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))

			it 'returns an array of review' do
				great = Review.new('Great movie', 'Great!!', 5)
				meh = Review.new('Meeehhh', 'Not impressive', 3)
				bad = Review.new('This movie sucks', "Don't watch it!", 0)

				movie.review << great
				movie.review << meh
				movie.review << bad

				expect(movie.review.length).to eq(3)
				expect(movie.review[0]).to eq(great)
				expect(movie.review[1]).to eq(meh)
				expect(movie.review[2]).to eq(bad)

			end
		end
	end

	describe 'movies rating' do
		let(:movie) do
			Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))

			it 'returns the rating' do
				great = Review.new('Great movie', 'Great!!', 5)
				meh = Review.new('Meeehhh', 'Not impressive', 3)
				bad = Review.new('This movie sucks', "Don't watch it!", 0)

				movie.review << great[2]
				movie.review << meh[2]
				movie.review << bad[2]

				expect(movie.rating).to eq(2.66667)

			end
		end
	end
end