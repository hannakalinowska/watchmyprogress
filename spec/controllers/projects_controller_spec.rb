require 'spec_helper'

describe ProjectsController do
  before do
    @user = mock_current_user
    controller.stub(:current_user).and_return(@user)
  end

  describe '#index' do
    it "lists user's projects" do
      @user.should_receive(:projects).and_return([mock_model(Project)])
      get :index
      response.should be_success
    end
  end

  describe '#new' do
    it "renders" do
      get :new
      response.should be_success
    end
  end

  describe '#create' do
    it "creates a project and redirects" do
      mock_project = mock_model(Project)
      mock_project.should_receive(:save).and_return(true)
      @user.stub_chain(:projects, :build).and_return(mock_project)

      post :create, :project => {
        :name => '100 test cake',
        :description => 'Wheres my cake',
        :start => '0',
        :target => '100'
      }
      response.should redirect_to(projects_path)
    end
  end

  describe '#edit' do
    it "renders" do
      @user.stub_chain(:projects, :find).and_return(mock_model(Project))
      get :edit, :id => '1'
      response.should be_success
    end
  end

  describe '#update' do
    it "updates a project and redirects" do
      mock_project = mock_model(Project)
      mock_project.should_receive(:update_attributes).and_return(true)
      @user.stub_chain(:projects, :find).and_return(mock_project)

      put :update, :id => '1', :project => {
        :name => '100 test cake',
        :description => 'Wheres my cake',
        :start => '0',
        :target => '100'
      }
      response.should redirect_to(projects_path)
    end
  end
end
