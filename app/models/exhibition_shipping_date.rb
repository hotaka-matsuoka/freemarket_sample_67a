class Exhibition_shipping_date < ActiveHash::Base
  self.data = [
      {id: 1, date: '１〜２日で発送'}, {id: 2, date: '２〜３日で発送'},
      {id: 3, date: '４〜７日で発送'}
  ]
end