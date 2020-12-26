class BookData
  include ActiveModel::Model
  attr_accessor :title, :publisher, :author, :publication_date, :isbn, :cover, :image, :description, :ccode_firstdigit_id, :ccode_seconddigit_id, :ccode_thirddigit_id, :keyword, :mood_text, :user_id


  # バリデーション
  with_options presence: true do
    validates :title
    validates :publisher
    validates :author
    validates :isbn, length: { is: 13 }, format: { with: /\A978/ }
    validates :mood_text
  end


  def save
    record_search = Book.where(isbn: isbn).first_or_initialize
    if record_search.id.nil?
      book = Book.create(title: title, publisher: publisher, author: author, publication_date: publication_date, isbn: isbn, ccode_firstdigit_id: ccode_firstdigit_id, ccode_seconddigit_id: ccode_seconddigit_id, ccode_thirddigit_id: ccode_thirddigit_id, cover: cover, image: image, description: description, user_id: user_id)
    

      keyword_array = keyword.split(';')
      keyword_array.each do |word|
        keyword = word
        keyword = Keyword.where(keyword: keyword).first_or_initialize
        keyword.save
        BookKeywordRelation.create(book_id: book.id, keyword_id: keyword.id)
      end

      mood = Mood.where(mood_text: mood_text).first_or_initialize
      mood.save

      BookMoodRelation.create(book_id: book.id, mood_id: mood.id)
    end
  end

end