class BooksController < ApplicationController

  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :publisher, :author, :publication_date, :isbn, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :description, :keyword)
  end

end
