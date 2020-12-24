class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :c_code_first
  belongs_to :c_code_second
  belongs_to :c_code_third
  belongs_to :mood
  has_many   :keywords

  # バリデーション
  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
    validates :isbn, length: { is: 13 }, format: { with: /\A978/ }, uniqueness: true
  end
end
