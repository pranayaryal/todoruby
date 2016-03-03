require 'rails_helper'

describe "Deleting todo lists" do

  it "displays the delete message after an article has been deleted" do

    visit "/todo_lists"
    within "#todo_list#{todo_list.id}" do
      click_link "Destroy"
    end
    click_link "Ok"
    todo_list.reload
    expect(page).to have_content("Todo list was successfully destroyed.")

  end
end
