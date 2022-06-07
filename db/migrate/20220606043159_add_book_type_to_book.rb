class AddBookTypeToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :book_type, :string
  end
end
