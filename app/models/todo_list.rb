class TodoList < ActiveRecord::Base
  validates :title, length: { minimum: 3}, presence: true
  validates :description, length: { minimum: 5}, presence: true
end
