require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "email@email.com",
      :password => "Password",
      :password_confirmation => "Password"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/email@email.com/)
    # expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Password/)
  end
end
