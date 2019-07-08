require 'rails_helper'

feature 'User can search for food' do
  scenario 'user submits sweet potatoes in search bar' do
    # As a user,
    # When I visit "/"
    visit '/'

    # And I fill in the search form with "sweet potatoes"
    # (Note: Use the existing search form)
    fill_in :q, with: 'sweet potatoes'
    # And I click "Search"
    click_on 'Search'

    # Then I should be on page "/foods"
    expect(current_path).to eq('/foods')

    # Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
    expect(page).to have_content('531 for sweet potatoes')
    
    # Then I should see a list of ten foods sorted by relevance.
    expect(page).to have_css(".foods", count: 10)

    # And for each of the foods I should see:
    # - The food's NDB Number
    # - The food's name
    # - The food group to which the food belongs
    # - The food's data source
    # - The food's manufacturer
    within(first('.foods')) do
      expect(page).to have_css(".ndbnumber")
      expect(page).to have_css(".name")
      expect(page).to have_css(".food-group")
      expect(page).to have_css(".data-source")
      expect(page).to have_css(".manufacturer")
    end
  end
end
