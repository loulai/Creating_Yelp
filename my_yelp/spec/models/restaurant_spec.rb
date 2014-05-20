require 'spec_helper'

describe Restaurant do

	it "is not valid without a name" do
		restaurant = Restaurant.new(name: nil)
		expect(restaurant).to have(1).error_on(:name)
	end


end
