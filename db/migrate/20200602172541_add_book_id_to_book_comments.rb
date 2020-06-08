class AddBookIdToBookComments < ActiveRecord::Migration[5.2]
  def change
    add_column :book_comments, :book_id, :integer
  end
end
