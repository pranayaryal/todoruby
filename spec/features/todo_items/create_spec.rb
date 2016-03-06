require 'rails_helper'

describe "Adding todo items" do
  let!(:todo_list) { todo_list = TodoList.create(title: "Groceries", description: "Grocery List.") }

  it "is successful with valid content" do
    visit_todo_list(todo_list)
    click_link "New Todo item"
    expect(page).to have_content("New Todo Item")
    fill_in "Content", with: "Milk"
    click_button "Save"
    expect(page).to have_content("Added todo list item.")
    within("ul.todo_items") do
      expect(page).to have_content("Milk")
    end
  end

  it "displays an error when the todo item has no content" do
    visit_todo_list(todo_list)
    click_link "New Todo item"
    expect(page).to have_content("New Todo Item")
    fill_in "Content", with: ""
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that todo list item.")
    end
    expect(page).to have_content("Content can't be blank")
  end

  it "displays an error with content less than 3 characters" do
    visit_todo_list(todo_list)
    click_link "New Todo item"
    expect(page).to have_content("New Todo Item")
    fill_in "Content", with: "as"
    click_button "Save"
    within("div.flash") do
      expect(page).to have_content("There was a problem adding that todo list item.")
    end
    expect(page).to have_content("Content is too short")
  end


end
