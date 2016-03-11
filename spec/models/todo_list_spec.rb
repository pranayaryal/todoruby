require 'rails_helper'

# RSpec.describe TodoList, type: :model do
describe TodoList do
  context "relationships" do
    it { should have_many(:todo_items) }
    it { should belong_to(:user) }
  end

  describe "#has_complete_items?" do
    let(:todo_list) { TodoList.create(title: "Groceries", description: "Grocery List")}

    it "returns true with completed todo list items" do
      todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(todo_list.has_completed_items?).to be true
    end

    it "returns false with completed todo list items" do
      todo_list.todo_items.create(content: "Eggs", completed_at: 1.minute.ago)
      expect(todo_list.has_incomplete_items?).to be false
    end
  end
end
