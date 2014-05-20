require 'spec_helper'

describe 'writing reviews' do

	before { Restaurant.create(name: 'Eat', address: '50 City Road', cuisine: 'pot pie')}

	specify 'restaurants begin with no reviews' do
		expect(page).to have_content('0 reviews')
	end

	it 'adds a review to the restaurant' do
		visit '/restaurants'
		click_link 'review Pret'

		fill_in 'Review', with: 'This restaurant was the bomb'
		select '4', from: 'Rating'
		click_button 'Leave Review'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('This restaurant was the bomb')
		expect(page).to have_content('1 review')
	end
end