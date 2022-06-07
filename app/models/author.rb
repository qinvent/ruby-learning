class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true
  validates_format_of :contact_no, :with => /[0-9]{10}/, allow_blank: true
  before_create do
    self.name = name.capitalize 
  end
end
