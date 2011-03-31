require 'spec_helper'

describe Project do

  before(:all) do
    @project = Project.make!
  end

  it { should have_many :task_groups}
  it { should have_many(:tasks).through(:task_groups) }
  it { should belong_to(:person) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :deadline }

  it "should not have a deadline earlier than the created date" do
      @project.deadline.should > @project.created_at
  end

end

