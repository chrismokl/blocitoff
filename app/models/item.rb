class Item < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 1 }, presence: true

  before_create :set_uncompleted
  
  def set_uncompleted
    self.completed ||= false
  end
end
