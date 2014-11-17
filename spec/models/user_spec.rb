require 'spec_helper'

describe User do

	before (:each) do 
		@attr = {:name => "Example User" , :email => "user@example.com"}
	end

	it "should create a new instance given a valid attribute" do 
		User.create!( @attr)
	end
	it "should require name" do 
		no_name_user = User.new( @attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end
	it "should require an email address" do 
		no_name_user = User.new( :email => "")
		no_name_user.should_not be_valid
	end

	it "should reject names that are too long" do
		long_name = "huda"*51
		long_name_user = User.new( @attr.merge( :name => long_name))
		long_name_user.should_not be_valid
	end
	it "should accept a valid email addresses" do 
		adds = %w[ u@foo.com THE_USER@foo.bar.com first.last@foo.jp]
		adds.each do |add|
			 valid_email_user= User.new(@attr.merge(:email => add)) 
			 valid_email_user.should be_valid
			end

	end

	it "should reject invalid email addresses" do 
		adds = %w[ u@foo,com THE_USER_at_foo.bar.com first.last@foo.]
		adds.each do |add|
			 invalid_email_user= User.new(@attr.merge(:email => add)) 
			 invalid_email_user.should_not be_valid
		end
	end
	it "should reject duplicate email addresses" do 
		User.create!( @attr)
		user_with_duplicate_email = User.new (@attr)
		user_with_duplicate_email.should_not be_valid

	end

	it "should reject email addresed identical up to case" do 
		upcased_email = "USER@EXAMPLE.COM"
		User.create!(@attr.merge(:email => upcased_email))
		user_duplicated = User.new(@attr) 
		user_duplicated.should_not be_valid
	end

end
