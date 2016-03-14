
require 'rails_helper'

describe "Forgotten passwords" do
  let!(:user) { create(:user) }

  it "sends a user an email" do
    visit login_path 
  end
end
