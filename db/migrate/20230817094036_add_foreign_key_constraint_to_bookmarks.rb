class AddForeignKeyConstraintToBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :bookmarks, :movies
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
  end
end
