class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many   :comments

  has_many  :book_keyword_relations, dependent: :destroy
  has_many  :keyword, through: :book_keyword_relations

  has_many :book_mood_relations, dependent: :destroy
  has_many :moods, through: :book_mood_relations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :CcodeFirstdigit
  belongs_to_active_hash :CcodeSeconddigit
  belongs_to_active_hash :CcodeThirddigit

  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
  end
end
