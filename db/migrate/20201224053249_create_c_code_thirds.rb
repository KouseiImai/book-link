class CreateCCodeThirds < ActiveRecord::Migration[6.0]
  def change
    create_table :c_code_thirds do |t|
      t.integer       :book_id, foreign_key: true
      t.integer       :ccode_thirddigit_id
      t.timestamps
    end
  end
end
