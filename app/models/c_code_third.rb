class CCodeThird < ApplicationRecord
  has_many :book_c_code_third_relations
  has_many :books, through: :book_c_code_third_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeThirddigit
end
