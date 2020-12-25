class CcodeFirstdigit < ActiveHash::Base
  self.data = [
    { id: 0, name: '一般' },
    { id: 1, name: '教養' },
    { id: 2, name: '実用' },
    { id: 3, name: '専門' },
    { id: 4, name: '検定教科書・消費税非課税品・その他' },
    { id: 5, name: '婦人' },
    { id: 6, name: '学参I（小中）' },
    { id: 7, name: '学参II（高校）' },
    { id: 8, name: '児童' },
    { id: 9, name: '雑誌扱い' }
  ]

  include ActiveHash::Associations
  has_many :books
end
