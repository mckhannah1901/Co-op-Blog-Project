require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    context "create a new user account with acceptable credentials" do

        it "successfully adds a new user" do
            expect{create_new_user}.to change(User, :count).by(1)
        end

        it "logs the user in upon account creation" do
            create_new_user
            expect(session[:user_id]).to_not be_nil
        end

        it "redirects a new user to their profile page upon creation" do
            create_new_user
            expect(response).to redirect_to(assigns(:user))
        end

    end

    context "GET #index" do

        it "shows the list of users, expects a redirect response to be 200" do
            get :index
            expect(response.status).to eq(200)
        end

    end

    context "GET #show" do

        it "shows a user their profile, expect redirect response to be 200" do
            user = FactoryBot.create :user
            user.save
            login(user)

            get :show, params: { id: user.id }
            expect(response.status).to eq(200)
        end

    end

    context "DELETE #destroy" do

        it "deletes a user from the database" do
            user = FactoryBot.create :user
            user.save
            login(user)

            expect{delete :destroy, params: { id: user.id }}.to change(User, :count).by(-1)
        end

    end

    context "PUT #update" do

        it "allows a user to update their data" do
            user = FactoryBot.create :user
            user.save
            login(user)

            put :update, params: { :id => user.id, :user => { :first_name => "Jane", :second_name => "Doe",
                                :email => "factorybot@test.com", :password => "password", :password => "password"}}
            user.reload

            expect(user.first_name).to eq("Jane")
            expect(response).to redirect_to(assigns(:user))
        end

    end

    private

        def create_new_user
            post :create, params: {:user => {:first_name => 'Testing', :second_name => 'Tested', :email => 'testing@tested.test', :password => 'password', :password_confirmation => 'password'}}
        end

        def login(user)
            session[:user_id] = user.id
        end

end
