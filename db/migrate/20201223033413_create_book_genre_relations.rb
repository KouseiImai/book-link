class CreateBookGenreRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_genre_relations do |t|
      t.references  :book, foreign_key: true
      t.references  :genre, foreign_key: true
      t.timestamps
    end
  end
end
