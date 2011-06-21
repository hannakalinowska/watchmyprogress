require 'spec_helper'

describe UpdatesController do
  before do
    @user = mock_current_user
    @project = mock_model(Project, :user => @user)
  end

  describe '#new' do
    it "renders" do
      get :new, :project_id => @project
      response.should be_success
    end
  end

  describe '#create' do
    it "creates a new update for a project" do
      post :create, :project_id => @project, :update => {:value => '20'}
      response.should redirect_to(projects_path)
    end
  end
end
