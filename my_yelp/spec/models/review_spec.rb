require 'spec_helper'

describe Review do

	it "is not valid if 'thoughts' field has less than three characters" do
		review = Review.new(thoughts: 'b', rating: 1)
		expect(review).to have(1).error_on(:thoughts)
	end

end
