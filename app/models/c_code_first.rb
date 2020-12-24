class CCodeFirst < ApplicationRecord
  has_many :book_c_code_first_relations
  has_many :books, through: :book_c_code_first_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeFirstdigit
end
