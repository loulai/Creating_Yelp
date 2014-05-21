require 'spec_helper'

describe Review do

	# it "is not valid if 'thoughts' field has less than three characters" do
	# 	review = Review.new(thoughts: 'b', rating: 1)
	# 	expect(review).to have(1).error_on(:thoughts)
	# end

	it "is not valid if rating is > 5 or < 1" do
		review = Review.new(thoughts: 'aint gonna eat here again, the toilets smell', rating: -1)
		expect(review).to have(1).error_on(:rating)
	end

end
