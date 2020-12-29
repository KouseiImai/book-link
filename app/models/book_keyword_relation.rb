class BookKeywordRelation < ApplicationRecord
  belongs_to :book
  belongs_to :keyword

  def self.search_relations(keyword_id)
    BookKeywordRelation.where(['keyword_id LIKE ?', keyword_id.to_s])
  end
end
