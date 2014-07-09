require 'spec_helper'

describe User do

	context "validations" do
		let(:user1) { User.new(first_name: "Katia", last_name: "Rokhlenko", user_name: "katia", email: "katia@yale.edu", password: "12345", password_confirmation: "12345") }
		let(:user2) { User.new(first_name: "Kevin", last_name: "Rosenberg", user_name: "KMAN", email: "kevin@gmail.com", password: "prince", password_confirmation: "prince") }
		let(:user3) { User.new(first_name: "Daniel", last_name: "Deutsch", user_name: "daniel", email: "daniel", password: "fall", password_confirmation: "fall") }

		before do
			user1.save
			user2.save
			user3.save
		end

		it "requires a first name" do
			expect(user1).to validate_presence_of(:first_name)
		end

		it "requires a last name" do
			expect(user1).to validate_presence_of(:last_name)
		end

		it "requires a user name" do
			expect(user1).to validate_presence_of(:user_name)
		end

		it "requires a unique user name" do
			expect(user1).to validate_uniqueness_of(:user_name)
		end

		it "downcases a user name before saving" do 
			expect(user2.user_name).to eq("kman")
		end

		it "requires a unique user name (case insensitive)" do
			user2.user_name = "kMan"
			expect(user2).to validate_uniqueness_of(:user_name)
		end

		it "requires an email" do
			expect(user1).to validate_presence_of(:email)
		end

		it "requires a unique email" do
			expect(user1).to validate_uniqueness_of(:email)
		end

		it "requires the email address to have a valid format" do
			expect(user3).to_not be_valid
		end

		it "downcases an email before saving" do 
			expect(user2.email).to eq("kevin@gmail.com")
		end

		it "requires a unique email (case insensitive)" do
			user2.email = "KEVIN@GMAIL.COM"
			expect(user2).to validate_uniqueness_of(:email)
		end
		
	end

end
