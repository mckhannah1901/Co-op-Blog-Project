require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { Micropost.new }

  context 'micropost with unacceptable data' do
    it 'fails if no title is present' do
      micropost.title = ''
      expect(micropost).to_not be_valid
    end

    it 'fails if no content is present' do
      micropost.content = ''
    end

    it 'fails if no user id is present' do
      micropost.user_id = ''
    end
  end
end
