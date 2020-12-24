class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many   :keywords

  has_many   :book_mood_relations
  has_many :moods, through: :book_mood_relations

  has_many   :book_c_code_first_relations
  has_many :c_code_firsts, through: :book_c_code_first_relations

  has_many :book_c_code_second_relations
  has_many :c_code_seconds, through: :book_c_code_second_relations

  has_many :book_c_code_third_relations
  has_many :c_code_thirds, through: :book_c_code_third_relations


end
