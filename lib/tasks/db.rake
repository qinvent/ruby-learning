namespace :db do
  desc "Change data type of book_type col of books table"
  task change_book_type: :environment do
    ActiveRecord::Migration[7.0].change_column(:books, :book_type, 'integer USING (book_type::integer)')
  end

end
