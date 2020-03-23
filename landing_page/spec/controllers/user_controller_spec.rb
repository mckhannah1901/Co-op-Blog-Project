require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    context "create a new user account with acceptable credentials" do

        it "successfully adds a new user" do
            expect{create_new_user}.to change(User, :count).by(1)
        end

        it "logs the user in upon account creation" do
            session_id  = session[:user_id]
            create_new_user
            expect(session[:user_id]).to_not eq(session_id)
        end

        it "redirects a new user to their profile page upon creation" do
            create_new_user
            expect(response).to redirect_to(assigns(:user))
        end

        def create_new_user
            post :create, params: {:user => {:first_name => 'Testing', :second_name => 'Tested', :email => 'testing@tested.test', :password => 'password', :password_confirmation => 'password'}}
        end
    end

end
