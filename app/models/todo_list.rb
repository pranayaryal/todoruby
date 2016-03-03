class TodoList < ActiveRecord::Base

  has_many :todo_items
  validates :title, length: { minimum: 3}, presence: true
  validates :description, length: { minimum: 5}, presence: true
end
