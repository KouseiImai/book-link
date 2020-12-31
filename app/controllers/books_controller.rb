class BooksController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_data, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book_data = BookData.new
  end

  def create
    @book_data = BookData.new(book_params)
    if @book_data.valid?
      @book_data.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @mood = Mood.new
    @comment = Comment.new
    @comments = @book.comments.includes(:user)
  end

  def mood_create
    unless params[:mood_text].nil?
      mood = Mood.where(mood_text: params[:mood][:mood_text]).first_or_initialize
      book_mood_relation = BookMoodRelation.where(mood_id: mood.id, book_id: params[:id]).first_or_initialize
      if book_mood_relation.id.nil?
        mood.save
        book_mood_relation = BookMoodRelation.create(mood_id: mood.id, book_id: params[:id])
        book_mood_relation.save
      end
    end
    redirect_to book_path
  end

  def edit
  end

  def update
    render :edit unless @book.update(book_edit_params)
  end

  def destroy
    render :show unless @book.destroy
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def book_params
    params.require(:book_data).permit(:title, :image, :publisher, :author, :publication_date, :isbn,
                                      :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id,
                                      :cover, :description, :keyword, :mood_text).merge(user_id: current_user.id)
  end

  def book_edit_params
    params.require(:book).permit(:title, :image, :publisher, :author, :publication_date, :isbn,
                                 :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id,
                                 :cover, :description).merge(user_id: current_user.id)
  end

  def mood_params
    params.require(:mood).permit(:mood_text)
  end

  def set_data
    @book = Book.find(params[:id])
    @mood_datas = @book.moods
  end
end
