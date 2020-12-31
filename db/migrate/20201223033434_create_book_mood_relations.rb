class CreateBookMoodRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_mood_relations do |t|
      t.references  :book,  foreign_key: true
      t.references  :mood,  foreign_key: true
      t.timestamps
    end
  end
end
