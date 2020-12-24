class BookData
  include Activemodel::Model
  attr_accessor :title, :publisher, :author, :publication_date, :isbn, :cover, :description, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :keyword, :mood_text


  # バリデーション
  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
    validates :isbn, length: { is: 13 }, format: { with: /\A978/ }, uniqueness: true
    validates :mood_text
  end

  def save
    book = Book.create(title: title, publisher: publisher, author: author, publication_date: publication_date, isbn: isbn, cover: cover, description: description)
    c_code_first = CCodeFirst.create(c_code_first: ccode_firstdigit_id, book_id: book.id)
    c_code_second = CCodeSecond.create(c_code_second: ccode_seconddigit_id, book_id: book.id)
    c_code_third = CCodeThird.create(c_code_third: ccode_thirddigit_id, book_id: book.id)
    Keyword.create(keyword: keyword, book_id: book.id)
    mood = Mood.create(mood_text: mood_text, book_id: book.id)

    BookCCodeFirstRelation.create(book_id: book.id, c_code_first_id: c_code_first.id)
    BookCCodeSecondRelation.create(book_id: book.id, c_code_second_id: c_code_second.id)
    BookCCodeThirdRelation.create(book_id: book.id, c_code_third_id: c_code_third.id)
    BookMoodRelation.create(book_id: book.id, mood_id: mood.id)
  end

end