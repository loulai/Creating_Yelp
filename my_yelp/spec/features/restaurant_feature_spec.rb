require 'spec_helper'

describe 'my restaurant index page' do
	
	context 'when there are no restaurants yet'
		
		it 'should show a message telling use there are no restaurants' do
			visit '/restaurants'
			expect(page).to have_content('No restaurants added yet')
		end	

end






























































































































































































































































































































































































































