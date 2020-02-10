class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> { order(create_at: :desc)}

  #validates :user_id

 # validates :content, length: {maximum: 300}

end
