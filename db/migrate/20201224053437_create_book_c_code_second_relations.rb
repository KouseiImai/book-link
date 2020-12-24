class CreateBookCCodeSecondRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :book_c_code_second_relations do |t|
      t.references  :book,  foreign_key: true
      t.references  :c_code_second,  foreign_key: true
      t.timestamps
    end
  end
end
