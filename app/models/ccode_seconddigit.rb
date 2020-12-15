class CcodeSeconddigit < ActiveHash::Base
  self.data = [
    { id: 0, name: '単行本'},
    { id: 1, name: '文庫'},
    { id: 2, name: '新書'},
    { id: 3, name: '全集・双書'},
    { id: 4, name: 'ムック・その他'},
    { id: 5, name: '事典・辞典'},
    { id: 6, name: '図鑑'},
    { id: 7, name: '絵本'},
    { id: 8, name: '磁性媒体など'},
    { id: 9, name: 'コミック'},
  ]

  include ActiveHash::Associations
  has_many :books

end
