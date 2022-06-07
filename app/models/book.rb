class Book < ApplicationRecord
  belongs_to :author
  
  validates :name,:published_at, presence: true
  before_create do
    self.name = name.capitalize 
  end
  after_create do
    Author.where(id: author_id).update("no_of_books = no_of_books + 1")
  end
  after_destroy do
    Author.where(id: author_id).update("no_of_books = no_of_books - 1")
  end

  BOOK_TYPE = {"Novel" => 0, "Short Stories" => 1, "Others" => 2}
end
