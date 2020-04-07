class Exibition_shipping_method < ActiveHash::Base
  self.data = [
      {id: 1, burden: '送料込み（出品者負担）'}, {id: 2, burden: '着払い（購入者負担）'}
  ]
end