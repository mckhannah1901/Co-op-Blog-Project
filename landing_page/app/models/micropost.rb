class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> { order(create_at: :desc)}

  validates :user_id, presence: true

  #validates :content, length: {maximum: 300}

  validates :title, presence: true
  validates :content, presence: true

end
