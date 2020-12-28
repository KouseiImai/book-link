class SearchsController < ApplicationController
  before_action :ccode_search_assistance, only: [:index, :ccode_search]

  def index
    @books = Book.all
    set_ccode
  end

  def mood_search
    mood = Mood.search_mood_id(params[:mood_text])
    if mood.blank?
      redirect_to "/searchs", flash: { mood_error: "入力値は登録されていません"}
    else
      relation = BookMoodRelation.search_relations(mood[0][:id])
      @search_result = []
      relation.each do |book|
        @search_result += Book.search_books(book.book_id)
      end
      render "search"
    end
  end

  def keyword_search
    keyword = Keyword.search_keyword_id(params[:keyword])
    if keyword.blank?
      redirect_to "/searchs", flash: { keyword_error: "入力値はキーワードとして登録されていません"}
    else
      relation = BookKeywordRelation.search_relations(keyword[0][:id])
      @search_result = []
      relation.each do |book|
        @search_result += Book.search_books(book.book_id)
      end
      render "search"
    end
  end

  def mood_text_search
    mood_text = Mood.search_mood(params[:word])
    render json:{ word: mood_text }
  end

  def keyword_text_search
    keyword_text = Keyword.search_keyword(params[:keyword])
    render json:{ keyword: keyword_text }
  end

  def ccode_search
    @search_result = @p.result
    render "search"
  end


  private

  def ccode_search_assistance
    @p = Book.ransack(params[:q])
  end

  def set_ccode
    ccode_firstdigits = Book.select("ccode_firstdigit_id").distinct
    ccode_seconddigits = Book.select("ccode_seconddigit_id").distinct
    ccode_thirddigits = Book.select("ccode_thirddigit_id").distinct

    @ccode_first_num=[]
    ccode_firstdigits.each do |ccode_firstdigit|
      @ccode_first_num << ccode_firstdigit.ccode_firstdigit_id
    end
    @ccode_second_num=[]
    ccode_seconddigits.each do |ccode_seconddigit|
      @ccode_second_num << ccode_seconddigit.ccode_seconddigit_id
    end
    @ccode_third_num=[]
    ccode_thirddigits.each do |ccode_thirddigit|
      @ccode_third_num << ccode_thirddigit.ccode_thirddigit_id
    end
  end

end
