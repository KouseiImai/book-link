class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string  :title,            null: false
      t.string  :publisher,        null: false
      t.string  :author,           null: false
      t.string  :publication_date
      t.string  :isbn,             null: false
      t.integer :ccode_firstdigit_id
      t.integer :ccode_seconddigit_id
      t.integer :ccode_thirddigit_id
      t.text    :description
      t.string  :keyword
      t.timestamps
    end
  end
end
