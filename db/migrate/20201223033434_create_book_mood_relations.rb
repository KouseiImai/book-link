class CreateBookMoodRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_mood_relations do |t|

      t.timestamps
    end
  end
end
