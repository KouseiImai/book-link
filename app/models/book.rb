class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeFirstdigit
  belongs_to_active_hash :CcodeSeconddigit
  belongs_to_active_hash :CcodeThirddigit

  # バリデーション
  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
    validates :isbn, length: { is: 13 }, format: { with: /\A978/ }, uniqueness: true
  end
end
