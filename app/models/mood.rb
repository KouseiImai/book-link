class Mood < ApplicationRecord
  has_many :book_mood_relations, dependent: :destroy
  has_many :books, through: :book_mood_relations
end
