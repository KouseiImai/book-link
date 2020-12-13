class Book < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeFirstdigit
  belongs_to_active_hash :CcodeSeconddigit
  belongs_to_active_hash :CcodeThirddigit


end
