require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    login(@user)
    allow(controller).to receive(:current_user).and_return(@user)
    @micropost = FactoryBot.create(:micropost, user_id: @user.id)
  end

  context 'create a new post with acceptable credentials' do
    it 'successfully adds a new post' do
      expect { create_new_micropost }.to change(Micropost, :count).by(1)
    end

    it 'redirects the user to the list of blog posts upon post creation' do
      create_new_micropost
      expect(response).to redirect_to(microposts_url)
      expect(flash[:success]).to be_present
    end
  end

  context 'GET #index' do
    it 'lists the posts' do
      get :index
      expect(assigns(:microposts)).to eq([@micropost])
      expect(response.status).to eq(200)
    end
  end

  context 'GET #show' do
    it 'shows the full post' do
      get :show, params: { id: @micropost.id }
      expect(response).to render_template('show')
      expect(response.status).to eq(200)
    end
  end

  context 'DELETE #destroy' do
    it 'soft deletes a post from the database' do
      expect do
        get :destroy,
            params: { id: @micropost.id }
      end .to change { Micropost.kept.count }.by(-1)
      expect(assigns(:microposts)).to be_nil
      expect(response).to redirect_to(microposts_url)
      expect(flash[:warning]).to be_present
    end
  end

  context ' GET #recover' do
    it 'should recover a soft deleted post' do
      get :destroy, params: { id: @micropost.id }
      expect do
        get :recover,
            params: { id: @micropost.id }
      end .to change { Micropost.kept.count }.by(1)
    end
  end

  context 'PUT #update' do
    it 'allows a user to update a post' do
      put :update, params: { id: @micropost.id, micropost: { title: 'Welcome!', user_id: @user.id } }
      @micropost.reload

      expect(@micropost.title).to eq('Welcome!')
      expect(response).to redirect_to(microposts_url)
      expect(flash[:success]).to be_present
    end

    it 'fails if a user is not logged in or a guest tries to edit a post' do
      logout(@user)
      @user.id = nil
      put :update, params: { id: @micropost.id, micropost: { title: 'Hello there!', user_id: @user.id } }
      @micropost.reload

      expect(@micropost.title).to_not eq('Hello there!')
      expect(response).to_not redirect_to(microposts_url)
    end
  end

private

  def login(_user)
    session[:user_id] = @user.id
  end

  def create_new_micropost
    post :create, params: { micropost: { title: 'Tests', content: 'Tested' } }
  end

  def logout(_user)
    session[:user_id] = nil
  end
end
