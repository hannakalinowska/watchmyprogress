require 'spec_helper'

describe 'Project Management' do
  before do
    login_as(Factory(:user))
    visit root_path
  end

  it 'creates a new project' do
    click_link 'New Project'
    fill_in 'Name', :with => '100 test cake!'
    fill_in 'Description', :with => 'Once I get to 100 tests I want my cake'
    fill_in 'Starts at', :with => '0'
    fill_in 'Ends at', :with => '100'
    click_button 'Create'

    page.should have_content('Project successfully created')
    page.should have_content('100 test cake!')
  end
  it 'views an existing project'
  it 'edits an existing project'
  it 'submits a reading to a project'
end
