class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :c_code_first
  belongs_to :c_code_second
  belongs_to :c_code_third
  belongs_to :mood
  has_many   :keywords

end
