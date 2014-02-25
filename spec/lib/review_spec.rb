require 'rspec'
require'review'

describe 'Review' do
	describe 'Review_Atributes' do
		let(:review) do
			Review.new('Nice Movie', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 4)
		end

		it 'has a title' do 
			expect(review.title).to eq('Nice Movie')
		end 

		it 'has a text' do 
			expect(review.text).to eq('Lorem ipsum dolor sit amet, consectetur adipisicing elit.')
		end

		it 'has a rating' do
			expect(review.rating).to eq(5)
		end
	end
end