class CreateArchivedposts < ActiveRecord::Migration[6.0]
  def change
    create_table :archivedposts do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
