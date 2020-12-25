class Keyword < ApplicationRecord
  has_many  :book_keyword_relations, dependent: :destroy
  has_many  :books, through: :book_keyword_relations
end
