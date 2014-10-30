class Item < ActiveRecord::Base
  belongs_to :list

  validates :title, length: { minimum: 1 }, presence: true

  before_create :set_uncompleted
  
  def set_uncompleted
    self.completed ||= false
    nil
  end
end
