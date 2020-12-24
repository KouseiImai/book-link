class CreateKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :keywords do |t|
      t.string        :keyword
      t.integer       :book_id, foreign_key: true
      t.timestamps
    end
  end
end
