require 'spec_helper'

describe TaskGroup do

  before(:all) do
    @task_group = TaskGroup.make!
  end

  it { should have_many :tasks }
  it { should belong_to :project }
  it { should have_many(:people).through(:assignments) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :objective }
  it { should validate_presence_of :deadline }

  it "should not have a deadline earlier than the created date" do
      @task_group.deadline.should > @task_group.created_at
  end

end

