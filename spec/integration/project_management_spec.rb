require 'spec_helper'

describe 'Project Management' do
  before do
    @user = Factory(:user)
    login_as(@user)
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

  it 'views an existing project' do
    Factory(:project, :name => '100 test cake', :user => @user)
    visit projects_path
    click_link '100 test cake'
    page.should have_content('100 test cake')
  end

  it 'edits an existing project' do
    Factory(:project, :name => '100 test cake', :user => @user)
    visit projects_path
    click_link 'Edit'
    page.should have_content('100 test cake')
    page.should have_selector('input[value=Update]')
  end

  it 'submits a reading to a project' do
    Factory(:project, :name => '100 test cake', :user => @user)
    visit projects_path
    click_link 'Add update'
    fill_in 'Value', :with => '20'
    click_button 'Add'
    page.should have_content('Update added')
    page.should have_content('Last update: less than a minute ago')
  end
end
