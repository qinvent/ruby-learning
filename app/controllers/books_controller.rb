class BooksController < ApplicationController

  def new 
    @author = Author.find(params[:author_id])
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)

    redirect_to author_path(@author)
  end

  def show
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
  end

  def edit
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
  end

  def update
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])

    if @book.update(book_params)
      redirect_to author_book_path(:author_id => @author,:id => @book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.destroy

    redirect_to author_path(@author), status: :see_other
  end

  private
  def book_params
    params.require(:book).permit(:name, :published_at)
  end
end
