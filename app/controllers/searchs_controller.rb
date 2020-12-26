class SearchsController < ApplicationController

  def mood_search
    return nil if params[:word] == ""
    mood_tag = Mood.where(['mood_text LIKE ?', "%#{params[:word]}%"] )
    render json:{ word: mood_tag }
  end
  
  def keyword_search
    return nil if params[:keyword] == ""
    keyword = Keyword.where(['keyword LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: keyword }
  end
  
end
