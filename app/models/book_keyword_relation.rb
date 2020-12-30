class BookKeywordRelation < ApplicationRecord
  belongs_to :book
  belongs_to :keyword

end
