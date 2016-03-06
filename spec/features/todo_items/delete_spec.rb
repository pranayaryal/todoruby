require 'rails_helper'

describe "Adding todo items" do
  let!(:todo_list) { todo_list = TodoList.create(title: "Groceries", description: "Grocery List.") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }
  def visit_todo_list(list)
    visit "/todo_lists"
    within "#todo_list_#{list.id}" do
      click_link "List Items"
    end
  end

  it "displays the delete message after the item has been deleted" do
    visit_todo_list(todo_list)
    within("#todo_item_#{todo_item.id}") do
      click_link "Delete"
    end
    expect(page).to have_content("Todo item was successfully destroyed.")
    expect(TodoItem.count).to eq(0)
  end

end