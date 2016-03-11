require 'rails_helper'

describe "Adding todo items" do
  let(:user) { todo_list.user}
  let!(:todo_list) { create(:todo_list) }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }
  before { sign_in user, password: 'treehouse1'}

  it "displays the delete message after the item has been deleted" do
    visit_todo_list(todo_list)
    within("#todo_item_#{todo_item.id}") do
      click_link "Delete"
    end
    expect(page).to have_content("Todo item was successfully destroyed.")
    expect(TodoItem.count).to eq(0)
  end

end
