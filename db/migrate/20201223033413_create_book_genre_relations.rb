class CreateBookGenreRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_genre_relations do |t|

      t.timestamps
    end
  end
end
