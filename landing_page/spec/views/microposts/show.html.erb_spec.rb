require 'rails_helper'

describe 'microposts/show.html.erb' do
  before :each do
    @user = FactoryBot.create(:user)
    allow(view).to receive(:current_user).and_return(@user)
    @micropost = FactoryBot.create(:micropost, user_id: @user.id)
  end

  context 'when the micropost has data' do
    it 'displays a micropost correctly' do
      assign(:micropost, FactoryBot.build(:micropost, user_id: @user.id))

      render

      expect(rendered).to have_content('Well hello there!')
    end
  end
end
