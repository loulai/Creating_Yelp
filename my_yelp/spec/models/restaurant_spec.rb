require 'spec_helper'

describe Restaurant do

	it "is not valid without a name" do
		restaurant = Restaurant.new(name: nil)
		expect(restaurant).to have(2).error_on(:name)
	end

	it "is not valid without an address" do
		restaurant = Restaurant.new(address: nil)
		expect(restaurant).to have(2).error_on(:address)
	end

	it "is not valid without a cuisine" do
		restaurant = Restaurant.new(cuisine: nil)
		expect(restaurant).to have(1).error_on(:cuisine)
	end

	it "is not valid unless the first letter is a capital" do
		restaurant = Restaurant.new(name: "abokado")
		expect(restaurant).to have(1).error_on(:name)
	end

	it "is not valid unless the address has three or more characters" do
		restaurant = Restaurant.new(address: "rd")
		expect(restaurant).to have(1).error_on(:address)
	end

	describe '#average_rating' do
		
		let(:nimcomsoup) { Restaurant.create(name: "NimComSoup", address: "Old Street Station", cuisine: "soup") }

		context 'no reviews yet' do
			it 'returns N/A when there are no reviews' do
				expect(nimcomsoup.average_rating).to eq "N/A"
			end
		end

		context 'one review' do
			before {nimcomsoup.reviews.create(rating: 3)}
			it 'returns the rating of the single review' do
				expect(nimcomsoup.average_rating).to eq 3
			end	
		end

		context 'more than one review' do
			before do
				nimcomsoup.reviews.create(rating: 3)
				nimcomsoup.reviews.create(rating: 5)
			end
			
			it 'returns the correct average rating' do
				expect(nimcomsoup.average_rating).to eq 4
			end	
		end

		context 'non-integer average' do
			before do
				nimcomsoup.reviews.create(rating: 2)
				nimcomsoup.reviews.create(rating: 5)
			end
			
			it 'returns the correct average rating to one decimal place' do
				expect(nimcomsoup.average_rating).to eq 3.5
			end	

		end
		

	

	end



end
