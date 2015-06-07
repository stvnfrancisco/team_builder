require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('team_builder path', {:type => :feature}) do
  it('goes to the index page') do
    visit('/')
    expect(page).to have_content('Team Builder App')
  end
  it('allows the user to see Team List') do
    visit('/')
    click_link('See Team List')
    expect(page).to have_content('Teams')
  end
  it('goes to the Add Team page') do
    visit('/')
    click_link('Add New Team')
    expect(page).to have_content('Add Teams')
  end
  # it('allows the user to add teams') do
  #   visit('/teams/new/')
  #   fill_in("name", :with => "Panther's")
  #   click_button('Add Team')
  #   visit('/teams')
  #   expect(page).to have_content("Successful")
  # end
end
