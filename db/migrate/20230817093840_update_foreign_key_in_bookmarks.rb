class UpdateForeignKeyInBookmarks < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :bookmarks, :movies
    add_foreign_key :bookmarks, :movies, on_delete: :restrict
    remove_foreign_key :bookmarks, :lists
    add_foreign_key :bookmarks, :lists, on_delete: :cascade
  end
end
