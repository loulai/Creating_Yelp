require 'spec_helper'

describe 'writing reviews' do

	before { Restaurant.create(name: 'Eat', address: '50 City Road', cuisine: 'Pot pie')}

	specify 'restaurants begin with no reviews' do
		visit '/restaurants'
		expect(page).to have_content('0 reviews')
	end

	context 'with valid data' do
		it 'adds a review to the restaurant' do
			visit '/restaurants'
			expect(page).to have_content('Eat')
			# click_link 'Review Eat'

			fill_in 'Thoughts', with: 'This restaurant was the bomb'
			select '4', from: 'Rating'
			click_button 'Leave Review'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content('This restaurant was the bomb')
			expect(page).to have_content('1 review')
		end
	end

	# context 'with invalid data' do
	# 	it 'shows an error' do
	# 		visit '/restaurants'
	# 		expect(page).to have_content('Eat')
	# 		click_link 'Review Eat'

	# 		fill_in 'Thoughts', with: 'Z'
	# 		select '1', from: 'Rating'
	# 		click_button 'Leave Review'

	# 		expect(page).to have_content('error')
	# 	end
	# end

	it 'calculates the average rating' do
		leave_review("I think there was a tooth in my chicken gyoza", 1)
		leave_review("I want to go to Pod", 3)

		expect(page).to have_content('Average Rating: 2')
	end

	def leave_review(thoughts, rating) 
		visit '/restaurants'
		# click_link 'Review Eat'
		fill_in 'Thoughts', with: thoughts
		select rating.to_s, from: 'Rating'
		click_button 'Leave Review'
	end

	
end