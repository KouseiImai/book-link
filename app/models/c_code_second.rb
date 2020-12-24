class CCodeSecond < ApplicationRecord
  has_many :book_c_code_second_relations
  has_many :books, through: :book_c_code_second_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeSeconddigit
end
