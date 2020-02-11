class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> { order(create_at: :desc)}

  validates :user_id, presence: true

  validates :content, length: {maximum: 140}

end
