class AddDiscardedAtToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :discarded_at, :datetime
    add_index :microposts, :discarded_at
  end
end
