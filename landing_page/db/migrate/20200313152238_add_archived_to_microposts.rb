class AddArchivedToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :archived, :boolean, :default => false
  end
end
