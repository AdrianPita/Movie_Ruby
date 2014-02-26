require 'spec_helper'
require 'similar_movies'

describe 'similar_movies' do 
	it  'gets a similar movies by genre' do
		die_hard = Movie.new('Die hard', 'accion', Date.new(2001, 10, 2))
		clerks = Movie.new('Clerks', 'accion')
		toy = Movie.new('Toy', 'animacion', Date.new(2012, 8, 2))

		similar_movie = Cinema.new([die_hard, toy, clerks])

		expect('accion').to eq('Die hard')
	end
end