class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if  @book.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image, :publisher, :author, :publication_date, :isbn, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :cover, :description, :keyword).merge(user_id: current_user.id)
  end

end
