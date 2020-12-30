class Keyword < ApplicationRecord
  has_many  :book_keyword_relations, dependent: :destroy
  has_many  :books, through: :book_keyword_relations

  def self.search_keyword_id(keyword)
    Keyword.where(['keyword LIKE ?', "%#{keyword}%"])
  end

  def self.search_keyword(keyword)
    return nil if keyword == ''
    Keyword.where(['keyword LIKE ?', "%#{keyword}%"])
  end
end
