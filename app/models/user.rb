class User < ApplicationRecord
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
    validates :password, format: { with: /[a-z\d]{6,}/ }
    validates :password_confirmation, format: { with: /[a-z\d]{6,}/ }
  end

end
