require 'rails_helper'

RSpec.describe User, type: :model do

    let (:user){User.new}

    context "user account with unacceptable data" do

        it "fails if the password and password confirmation does not match" do
            user.password_confirmation = "password123"
            expect(user).to_not be_valid
        end

        it "fails if the password is less than 6 characters long" do
            user.password = "pass"
            expect(user).to_not be_valid
        end  

        it "fails if no password is present" do
            user.password = nil
            expect(user).to_not be_valid
        end

        it "fails if the email does not match the required format" do
            user.email = "1.com"
            expect(user).to_not be_valid

            user.email = "@gmail.com"
            expect(user).to_not be_valid

            user.email = "1@gmail"
            expect(user).to_not be_valid

            user.email = "1"
            expect(user).to_not be_valid
        end

        it "fails if the email has already been taken up by another user" do
            User.new(:first_name => 'Testing', :second_name => 'Tested', :email => 'testing@tested.test',
                    :password => 'password', :password_confirmation => 'password').save
            user_created = User.new(:first_name => 'Second', :second_name => 'Test', :email => 'testing@tested.test',
                    :password => 'password123', :password_confirmation => 'password123').save

            expect(user_created).to eq(false)
        end

        it "fails if the email is longer than 100 characters" do
            user.email = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz@gmail.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
            expect(user).to_not be_valid
        end

        it "fails if no email is present" do
            user.email = nil
            expect(user).to_not be_valid
        end

        it "fails if no forename is present" do
            user.first_name = nil
            expect(user).to_not be_valid
        end

        it "fails if forename is longer than 50 letters" do
            user.first_name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
            expect(user).to_not be_valid
        end

        it "fails if no surname is present" do
            user.second_name = nil
            expect(user).to_not be_valid
        end

        it "fails if surname is longer than 50 letters" do
            user.second_name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
            expect(user).to_not be_valid
        end

    end
    
end
