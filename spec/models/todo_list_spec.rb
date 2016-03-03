require 'rails_helper'

# RSpec.describe TodoList, type: :model do
describe TodoList do
  it { should have_many(:todo_items)}
end
