class Mood < ApplicationRecord
  has_many :book_mood_relations, dependent: :destroy
  has_many :books, through: :book_mood_relations

  def self.search_mood_id(mood_text)
    Mood.where(['mood_text LIKE ?', "%#{mood_text}%"] )
  end

  def self.search_mood(word)
    return nil if word == ""
    Mood.where(['mood_text LIKE ?', "%#{word}%"] )
  end

end
