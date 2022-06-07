class AddEmailAndContactNoToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :email, :string
    add_column :authors, :contact_no, :string
  end
end
