class Mood < ApplicationRecord
  has_many :book_mood_relations
  has_many :books, through: :book_mood_relations
end
