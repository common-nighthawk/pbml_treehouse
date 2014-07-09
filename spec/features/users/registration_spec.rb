require "spec_helper"

describe "Signing up" do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up for PictureBook My Life")

		fill_in "First Name", with: "Katia"
		fill_in "Last Name", with: "Rokhlenko"
		fill_in "User Name", with: "katia"
		fill_in "Email", with: "katia@yale.edu"
		fill_in "Password", with: "12345"
		fill_in "Password Confirmation", with: "12345"
		click_button "Create User"

		expect(User.count).to eq(1)
	end
end