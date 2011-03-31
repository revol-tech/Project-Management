class Task < ActiveRecord::Base
  belongs_to :task_group
  belongs_to :person

  validates :title, :presence => true
  validates :objective, :presence => true
  validates :deadline, :presence => true
  validates_datetime :deadline, :on_or_after => DateTime.now
  after_initialize :date_today
  before_create :default_values
  before_save :check_null_comment

  def change_status #TODO- TOGGLE TASK STATUS USING THIS METHOD
    if self.complete == true
      self.complete == false
    else
      self.complete == true
    end
  end

  private

  def date_today
    self.deadline ||= DateTime.now
  end

  def default_values
    self.complete = false
    self.comment = ''
  end

  def check_null_comment
    if self.complete == true && self.comment.length == 0
      self.complete = false
      return false, #TODO-Display:error => "Cannot Complete Without Comment"
    end
    return true
  end


end
