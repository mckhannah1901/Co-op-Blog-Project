require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    before :each do
        @user = FactoryBot.create(:user)
        session[:user_id] = @user.id
        login(@user)
    end

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

            it "lists the users" do
                get :index
                expect(assigns(:users)).to eq([@user])
                expect(response.status).to eq(200)
            end

        end

        context "GET #show" do

            it "shows a user their profile" do
                get :show, params: { id: @user.id }
                expect(response).to render_template('show')
                expect(response.status).to eq(200)
            end

            it "won't show a user's profile if not logged in" do
                logout(@user)

                get :show, params: { id: @user.id }
                expect(response).to_not render_template('show')
                expect(response.status).to eq(302)
            end

        end

        context "DELETE #destroy" do

            it "deletes a user from the database" do
                expect{delete :destroy, params: { id: @user.id }}.to change(User, :count).by(-1)
                expect(assigns(:users)).to be_nil
            end

            it "fails if a user is not logged in and tries to delete their data" do
                logout(@user)

                expect{delete :destroy, params: { id: @user.id }}.to change(User, :count).by(0)
            end

        end

        context "PUT #update" do

            it "allows a user to update their data" do
                put :update, params: { :id => @user.id, :user => { :first_name => "Jane", :second_name => "Doe",
                                    :email => "factorybot@test.com", :password => "password", :password_confirmation => "password"}}
                @user.reload

                expect(@user.first_name).to eq("Jane")
                expect(response).to redirect_to(assigns(:user))
            end

            it "fails if a user is not logged in and tries to update their data" do
                logout(@user)
                put :update, params: { :id => @user.id, :user => { :first_name => "Jane", :second_name => "Doe",
                    :email => "factorybot@test.com", :password => "password", :password_confirmation => "password"}}
                @user.reload

                expect(@user.first_name).to_not eq("Jane")
                expect(response).to_not redirect_to(assigns(:user))
                expect(response.status).to eq(302)
            end

        end

    private

        def create_new_user
            post :create, params: {:user => {:first_name => 'Testing', :second_name => 'Tested', :email => 'testing@tested.test', :password => 'password', :password_confirmation => 'password'}}
        end

        def login(user)
            session[:user_id] = @user.id
        end

        def logout(user)
            session[:user_id] = nil
        end

end
