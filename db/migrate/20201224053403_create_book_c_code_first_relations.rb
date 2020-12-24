class CreateBookCCodeFirstRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_c_code_first_relations do |t|
      t.references  :book,  foreign_key: true
      t.references  :c_code_first,  foreign_key: true
      t.timestamps
    end
  end
end
