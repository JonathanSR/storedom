require 'rails_helper'

describe "when guest visits root page" do 
  it "guest can sign up and become a user" do
    name = "User1"
    email ="abc"
    password = "123"

    visit "items/index"

    click_on "Sign Up", user_path(user)

    fill_in "user_name", with: name
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_on "Create User"
  
    expect(page).to have_content("Sign Up")
    expect(current_path).to eq("/users/#{User.last.id}")
    expect(User.count).to eq(1)
  end
end
