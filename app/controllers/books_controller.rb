class BooksController < ApplicationController
  def new 
    @author = Author.find(params[:author_id])
  end
  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    redirect_to author_path(@author)
  end

  private
    def book_params
      params.require(:book).permit(:name, :published_at)
    end
end
