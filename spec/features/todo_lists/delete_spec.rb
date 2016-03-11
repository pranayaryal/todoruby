require 'rails_helper'

describe "Deleting todo lists" do
  let(:user) { todo_list.user}
  let!(:todo_list) { create(:todo_list) }


  before do
    sign_in user, password: "treehouse1"
  end

  it "displays the delete message after an article has been deleted" do

    visit "/todo_lists"
    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end
    expect(page).to have_content("Todo list was successfully destroyed.")
    expect(page).to_not have_content(todo_list.title)
    expect(TodoList.count).to eq(0)

  end

end
