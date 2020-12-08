class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
