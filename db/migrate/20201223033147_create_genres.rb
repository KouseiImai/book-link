class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.integer       :bookid, foreign_key: true
      t.integer       :ccode_firstdigit_id
      t.integer       :ccode_seconddigit_id
      t.integer       :ccode_thirddigit_id
      t.timestamps
    end
  end
end
