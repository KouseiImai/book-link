class CreateBookKeywordRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_keyword_relations do |t|
      t.references  :book,  foreign_key: true
      t.references  :keyword,  foreign_key: true
      t.timestamps
    end
  end
end
