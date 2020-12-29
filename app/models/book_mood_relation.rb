class BookMoodRelation < ApplicationRecord
  belongs_to :book
  belongs_to :mood

  def self.search_relations(mood_id)
    BookMoodRelation.where(['mood_id LIKE ?', mood_id.to_s])
  end
end
