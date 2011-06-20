require 'spec_helper'

describe Project do
  context '#progress' do
    before do
      @project = Factory.build(:project)
    end

    it "returns progress for integers" do
      @project.attributes = {:starts_at => '10', :ends_at => '60'}
      @project.stub(:last_update).and_return(mock_model(Update, :value => '20'))

      @project.progress.should == 20
    end

    it "returns progress for decimals" do
      @project.attributes = {:starts_at => '11.5', :ends_at => '82.3'}
      @project.stub(:last_update).and_return(mock_model(Update, :value => '13.8'))

      @project.progress.round(2).should == 3.25
    end

    it "returns 0 if no progress recorded" do
      @project.stub(:last_update).and_return(nil)
      @project.progress.should == 0
    end
  end
end
