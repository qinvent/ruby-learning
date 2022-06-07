class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      respond_to do |format|
        format.html { redirect_to authors_path, notice: "Author was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to authors_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.books.destroy_all
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_path, notice: "Author was successfully destroyed." }
      format.turbo_stream
    end
  end

  private
    def author_params
      params.require(:author).permit(:name,:email,:contact_no,:address)
    end
end
