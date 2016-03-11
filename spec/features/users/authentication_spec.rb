require 'rails_helper'

describe "Logging In" do
  it "logs the user in  and goes to the todo lists" do
    User.create(
      first_name: "Jason",
      last_name: "Seifer",
      email: "jason@treehouse.com",
      password: "treehouse1",
      password_confirmation: "treehouse1"
    )
    visit new_user_session_path
    fill_in "Email", with: "jason@treehouse.com"
    fill_in "Password", with: "treehouse1"
    click_button "Log In"
    expect(page).to have_content("Todo Lists")
    expect(page).to have_content("Thanks for logging in!")
  end
  it "populates the email field with the old email in the event of a failed login" do
    visit new_user_session_path
    fill_in "Email", with: "jason@treehouse.com"
    fill_in "Password", with: "incorrect"
    click_button "Log In"

    expect(page).to have_content("Please check your email and password")
    expect(page).to have_field("Email", with: "jason@treehouse.com")
  end

end
