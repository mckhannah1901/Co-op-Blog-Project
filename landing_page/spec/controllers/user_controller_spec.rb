require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    context "create a new user account with acceptable credentials" do

        it "successfully adds a new account to users" do
            expect{create_new_account}.to change(User, :count).by(1)
        end

        it "logs the user in upon account creation" do
            create_new_account
            expect(session[:user_id]).to_not be_nil
        end

        it "redirects a new user to their profile page upon creation" do
            create_new_account
            expect(response).to redirect_to(assigns(:user))
        end

        def create_new_account
            post :create, params: {:user => {:first_name => 'Testing', :second_name => 'Tested', :email => 'testing@tested.test', :password => 'password', :password_confirmation => 'password'}}
        end
        
    end
end