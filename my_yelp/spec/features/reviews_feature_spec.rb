require 'spec_helper'

describe 'writing reviews' do

	before { Restaurant.create(name: 'Eat', address: '50 City Road', cuisine: 'Pot pie')}
	let (:KoreanBBQ) { Restaurant.create(name: 'KoreanBBQ', address: 'korea town', cuisine: 'Korean')}

	specify 'restaurants begin with no reviews' do
		visit '/restaurants'
		expect(page).to have_content('0 reviews')
	end

	context 'with valid data' do
		it 'adds a review to the restaurant' do
			visit '/restaurants'
			expect(page).to have_content('Eat')
			click_link 'Review Eat'

			fill_in 'Thoughts', with: 'This restaurant was the bomb'
			select '4', from: 'Rating'
			click_button 'Leave Review'

			expect(current_path).to eq '/restaurants'
			expect(page).to have_content('This restaurant was the bomb')
			expect(page).to have_content('1 review')
		end
	end

	context 'with invalid data' do
		it 'shows an error' do
			visit '/restaurants'
			expect(page).to have_content('Eat')
			click_link 'Review Eat'

			fill_in 'Thoughts', with: 'Z'
			select '1', from: 'Rating'
			click_button 'Leave Review'

			expect(page).to have_content('error')
		end
	end

	it 'calculates the average rating' do
		visit '/restaurants'

	end

	def leave_review(thoughts, rating) 
		fill_in 'Thoughts', with: thoughts
		select rating.to_s, from: 'Rating'
		click_button 'Leave Review'
	end

	
end