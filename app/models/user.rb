class User < ApplicationRecord
  has_many  :books
  has_many  :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender, :age

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  with_options presence: true do
    validates :gender_id
    validates :age_id
    validates :nickname, length: { maximum: 40 }
    validates :email, uniqueness: true, format: { with: /@./ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  end

  def self.guest
    find_or_create_by(email: 'guest@gmail.com') do |user|
      user.nickname = 'ゲスト'
      user.gender_id = 0
      user.age_id = 2
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end
end
