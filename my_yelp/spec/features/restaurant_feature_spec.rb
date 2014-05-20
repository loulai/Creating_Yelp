require 'spec_helper'

describe 'my restaurant index page' do
	
	context 'when there are no restaurants yet'
		
		it 'should show a message telling user there are no restaurants' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants added yet')
		end	

end

describe 'creating a restaurant' do

	it 'should add a restaurant to the index' do
		visit '/restaurants/new'
		fill_in 'Name', with: 'Pod'
		fill_in 'Address', with: '1 City Road'

		click_button 'Create Restaurant'

		expect(current_path).to eq('/restaurants')

		expect(page).to have_content('Pod')
	end
	
end

describe "editing a restaurant" do

	before { Restaurant.create(name: 'Pret', address: '5 City Road')}

	it 'saves the change to the restaurant' do
		visit '/restaurants'
		click_link 'Edit Pret'

		fill_in 'Name', with: "Pret a Manger"

		click_button 'Update Restaurant'

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'Pret a Manger'
	end
  
end

describe "deleting a restaurant" do
		
	before {Restaurant.create(name: 'Abokado', address: '10 City Road')}

	it 'deletes a restaurant from the database' do
		visit '/restaurants'
		click_link 'Delete Abokado'

		expect(current_path).to eq '/restaurants'
		expect(page).to_not have_content 'Abokado'
	end

end









































































































































































































































































































