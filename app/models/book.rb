class Book < ApplicationRecord
  has_one_attahed :image
  belongs_to :ccodefirstdigit, :ccodeseconddigit, :ccodethirddigit
end
