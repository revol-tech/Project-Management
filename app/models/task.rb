class Task < ActiveRecord::Base
  belongs_to :task_group

  validates :title, :presence => true
  validates :objective, :presence => true
  validates :deadline, :presence => true
  validates_datetime :deadline, :on_or_after => DateTime.now
  after_initialize :date_today
  before_create :default_values
  before_save :check_null_comment

  private

  def date_today
    self.deadline ||= DateTime.now
  end

  def default_values
    self.complete = false
    self.comment = nil
  end

  def check_null_comment
    return true
  end

end
