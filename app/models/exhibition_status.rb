class Exhibition_status < ActiveHash::Base
  self.data = [
      {id: 1, status: '新品、未使用'}, {id: 2, status: '未使用に近い'},
      {id: 3, status: '目立った傷や汚れなし'}, {id: 4, status: 'やや傷や汚れあり'},
      {id: 5, status: '傷や汚れあり'}, {id: 6, status: '全体的に状態が悪い'},
  ]
end