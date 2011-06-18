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
end
