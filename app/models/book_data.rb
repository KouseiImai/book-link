class BookData
  include ActiveModel::Model
  attr_accessor :title, :publisher, :author, :publication_date, :isbn, :cover, :description, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :keyword, :mood_text, :user_id


  # バリデーション
  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
    validates :isbn, length: { is: 13 }, format: { with: /\A978/ }
    validates :mood_text
  end


  def save
    book = Book.create(title: title, publisher: publisher, author: author, publication_date: publication_date, isbn: isbn, ccode_firstdigit_id: ccode_firstdigit_id, ccode_seconddigit_id: ccode_seconddigit_id, ccode_thirddigit_id: ccode_thirddigit_id, cover: cover, description: description, user_id: user_id)

    keyword_array = keyword.split(';')
    keyword_array.each do |word|
      book_keyword = Keyword.new
      book_keyword.keyword = word
      book_keyword.book_id = book.id
      book_keyword.save
    end

    mood = Mood.create(mood_text: mood_text, book_id: book.id, user_id: user_id)
    BookMoodRelation.create(book_id: book.id, mood_id: mood.id)
  end

end