class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :user_id,          null: false,  foreign_key: true
      t.string  :title,            null: false
      t.string  :publisher,        null: false
      t.string  :author,           null: false
      t.string  :publication_date
      t.string  :isbn,             null: false
      t.string  :cover
      t.text    :description
      t.timestamps
    end
  end
end
