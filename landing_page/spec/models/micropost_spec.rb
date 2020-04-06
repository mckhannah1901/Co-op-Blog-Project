require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost) { Micropost.new }

  context 'micropost with unacceptable data' do
    it 'fails if no title is present' do
      micropost.title = ''
      expect(micropost.title).to be_empty
      expect(micropost).to_not be_valid
    end

    it 'fails if no content is present' do
      micropost.content = ''
      expect(micropost.content).to be_empty
      expect(micropost).to_not be_valid
    end

    it 'fails if no user id is present' do
      micropost.user_id = ''
      expect(micropost.user_id).to be_nil
      expect(micropost).to_not be_valid
    end
  end
end
