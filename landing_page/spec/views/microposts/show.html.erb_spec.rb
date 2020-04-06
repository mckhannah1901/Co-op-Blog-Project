require 'rails_helper'

describe 'microposts/show.html.erb' do
  before :each do
    @user = FactoryBot.create(:user)
    session[:user_id] = @user.id
    login(@user)
  end

  context 'when the micropost has data' do
    it 'displays a micropost correctly' do
      assign(:micropost, FactoryBot.build(:micropost, user_id: @user.id))

      render

      expect(rendered).to have_content('Well hello there!')
    end
  end

private

  def login(_user)
    session[:user_id] = @user.id
  end
end
