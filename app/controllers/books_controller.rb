class BooksController < ApplicationController

  def new 
    @author = Author.find(params[:author_id])
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.create(book_params)
    AuthorMailer.mailsend(@author)
    respond_to do |format|
      format.html { redirect_to author_path(@author), notice: "Book was successfully created." }
      format.turbo_stream
    end
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
      redirect_to author_path(@author)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:author_id])
    @book = @author.books.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to author_path(@author), notice: "Book was successfully destroyed." }
      format.turbo_stream
    end
  end

  private
  def book_params
    params.require(:book).permit(:name,:book_type,:published_at)
  end
end
