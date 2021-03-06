class CcodeThirddigit < ActiveHash::Base
  self.data = [
    { id: 0o0, name: '総記' },
    { id: 0o1, name: '百科事典' },
    { id: 0o2, name: '年鑑・雑誌' },
    { id: 0o4, name: '情報科学' },
    { id: 10, name: '哲学' },
    { id: 11, name: '心理（学）' },
    { id: 12, name: '倫理（学）' },
    { id: 14, name: '宗教' },
    { id: 15, name: '仏教' },
    { id: 16, name: 'キリスト教' },
    { id: 20, name: '歴史総記' },
    { id: 21, name: '日本歴史' },
    { id: 22, name: '外国歴史' },
    { id: 23, name: '伝記' },
    { id: 25, name: '地理' },
    { id: 26, name: '旅行' },
    { id: 30, name: '社会化学総記' },
    { id: 31, name: '政治-含む国防軍事' },
    { id: 32, name: '法律' },
    { id: 33, name: '経済・財政・統計' },
    { id: 34, name: '経営' },
    { id: 36, name: '社会' },
    { id: 37, name: '教育' },
    { id: 39, name: '民族・風習' },
    { id: 40, name: '自然化学総記' },
    { id: 41, name: '数学' },
    { id: 42, name: '物理学' },
    { id: 43, name: '化学' },
    { id: 44, name: '天文・地学' },
    { id: 45, name: '生物学' },
    { id: 47, name: '医学・歯学・薬学' },
    { id: 50, name: '工学・工学総記' },
    { id: 51, name: '土木' },
    { id: 52, name: '建築' },
    { id: 53, name: '機械' },
    { id: 54, name: '電気' },
    { id: 55, name: '電子通信' },
    { id: 56, name: '海事' },
    { id: 57, name: '採鉱・治金' },
    { id: 58, name: 'その他の工業' },
    { id: 60, name: '産業総記' },
    { id: 61, name: '農林業' },
    { id: 62, name: '水産業' },
    { id: 63, name: '商業' },
    { id: 65, name: '交通・通信' },
    { id: 70, name: '芸術総記' },
    { id: 71, name: '絵画・彫刻' },
    { id: 72, name: '写真・工芸' },
    { id: 73, name: '音楽・舞踊' },
    { id: 74, name: '演劇・映画' },
    { id: 75, name: '体育・スポーツ' },
    { id: 76, name: '諸芸・娯楽' },
    { id: 77, name: '家事' },
    { id: 78, name: '日記・手帳' },
    { id: 79, name: 'コミックス・劇画' },
    { id: 80, name: '語学総記' },
    { id: 81, name: '日本語' },
    { id: 82, name: '英米語' },
    { id: 84, name: 'ドイツ語' },
    { id: 85, name: 'フランス語' },
    { id: 87, name: '各国語' },
    { id: 90, name: '文学総記' },
    { id: 91, name: '日本文学総記' },
    { id: 92, name: '日本文学詩歌' },
    { id: 93, name: '日本文学・小説・物語' },
    { id: 95, name: '日本文学・評論・随筆・その他' },
    { id: 97, name: '外国文学小説' },
    { id: 98, name: '外国文学、その他' }
  ]

  include ActiveHash::Associations
  has_many :books
end
