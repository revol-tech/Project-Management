class TaskGroup < ActiveRecord::Base
  belongs_to :project
  has_many :tasks
  has_many :people, :through => :tasks

  validates :title, :presence => true
  validates :objective, :presence => true
  validates :deadline, :presence => true
  validates_datetime :deadline, :on_or_after => DateTime.now
  after_initialize :date_today

  private

  def date_today
    self.deadline ||= DateTime.now
  end
end
