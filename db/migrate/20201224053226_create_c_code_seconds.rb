class CreateCCodeSeconds < ActiveRecord::Migration[6.0]
  def change
    create_table :c_code_seconds do |t|
      t.integer       :book_id, foreign_key: true
      t.integer       :ccode_seconddigit_id
      t.timestamps
    end
  end
end
