class AuthorMailer < ApplicationMailer
  def self.mailsend(author)
    @author = author
    ActionMailer::Base.mail(
      to: @author.email,
      subject: "Book Creation", 
      body: "This is book is added successfully."
    ).deliver_now
  end
end
