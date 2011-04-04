class TaskGroup < ActiveRecord::Base
  belongs_to :project
  has_many :tasks, :dependent => :destroy
  has_many :people, :through => :tasks

  validates :title, :presence => true
  validates :objective, :presence => true

end
