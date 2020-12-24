class BookData
  include ActiveModel::Model
  attr_accessor :title, :publisher, :author, :publication_date, :isbn, :cover, :description, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :keyword, :mood_text, :user_id


  # バリデーション
  # with_options presence: true do
  #   validates :title
  #   validates :publisher
  #   validates :author
  #   # validates :isbn, length: { is: 13 }, format: { with: /\A978/ }, uniqueness: true
  #   validates :mood_text
  # end

  def save
    book = Book.create!(title: title, publisher: publisher, author: author, publication_date: publication_date, isbn: isbn, cover: cover, description: description, user_id: user_id)
    c_code_first = CCodeFirst.create!(ccode_firstdigit_id: ccode_firstdigit_id, book_id: book.id)
    c_code_second = CCodeSecond.create!(ccode_seconddigit_id: ccode_seconddigit_id, book_id: book.id)
    c_code_third = CCodeThird.create!(ccode_thirddigit_id: ccode_thirddigit_id, book_id: book.id)
    keyword_array = keyword.split(';')
    keyword_array.each do |word|
      book_keyword = Keyword.new
      book_keyword.keyword = word
      book_keyword.book_id = book.id
      book_keyword.save
    end


    mood = Mood.create!(mood_text: mood_text, book_id: book.id, user_id: user_id)

    BookCCodeFirstRelation.create!(book_id: book.id, c_code_first_id: c_code_first.id)
    BookCCodeSecondRelation.create!(book_id: book.id, c_code_second_id: c_code_second.id)
    BookCCodeThirdRelation.create!(book_id: book.id, c_code_third_id: c_code_third.id)
    BookMoodRelation.create!(book_id: book.id, mood_id: mood.id)
  end

end