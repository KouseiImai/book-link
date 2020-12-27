class SearchsController < ApplicationController
  before_action :ccode_search_assistance, only: [:index, :ccode_search]

  def index
    @books = Book.all
    set_ccode
  end

  def search
    binding.pry
  end

  def mood_search
    mood_tag = Mood.search_mood(params[:word])
    render json:{ word: mood_tag }
  end

  def keyword_search
    keyword = Keyword.search_keyword(params[:keyword])
    render json:{ keyword: keyword }
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
