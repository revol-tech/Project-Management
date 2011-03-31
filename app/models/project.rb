class Project < ActiveRecord::Base
  has_many :task_groups
  has_many :tasks, :through => :task_groups
  belongs_to :person

  validates :title,:presence => true, :length => {:minimum =>3}
  validates :deadline,:presence =>true
  validates :description,:presence =>true
  validates_datetime :deadline, :on_or_after => DateTime.now
  validates :person, :presence => true
  after_initialize :date_today

  private

  def date_today
    self.deadline ||= DateTime.now
  end
end
