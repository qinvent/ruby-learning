class AddAddressAndNoOfBooksToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :address, :string
    add_column :authors, :no_of_books, :integer ,default: 0
  end
end
