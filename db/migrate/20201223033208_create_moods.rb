class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.string      :mood_text,  null: false
      t.integer     :user_id,    foreign_key: true
      t.integer     :book_id,    foreign_key: true
      t.timestamps
    end
  end
end
