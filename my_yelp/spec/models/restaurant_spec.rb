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



end
