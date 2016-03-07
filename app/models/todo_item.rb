class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  validates :content, length: { minimum: 3}, presence: true

  def completed?
    !completed_at.blank?
  end
end
