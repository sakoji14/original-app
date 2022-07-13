class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '果物' },
    { id: 2, name: '野菜' },
    { id: 3, name: '魚' },
    { id: 4, name: '魚介その他' },
    { id: 5, name: '牛肉・豚肉・鶏肉' },
    { id: 6, name: '肉加工品' },
    { id: 7, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items
end