class Micropost < ApplicationRecord
  include Discard::Model

  belongs_to :user

  validates :user_id, presence: true

  validates :title, presence: true
  validates :content, presence: true
  has_rich_text :content

  attribute :archived, :boolean, default: false

end
