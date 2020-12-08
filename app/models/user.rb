class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender, :age

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
