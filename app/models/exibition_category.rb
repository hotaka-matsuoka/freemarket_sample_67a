# class Exibition_category < ActiveHash::Base
#   belongs_to :parent, class_name: :exibition_category
#   has_many :children, class_name: :exibition_category, foreign_key: :parent_id
#   self.data = [
#       {id: 1, category: 'レディース'},          {id: 2, category: 'メンズ'}, 
#       {id: 3, category: 'ベビー・キッズ'},      {id: 4, category: 'インテリア・住まい・小物'},
#       {id: 5, category: '本・音楽・ゲーム'},    {id: 6, category: 'おもちゃ・ホビー・グッズ'}, 
#       {id: 7, category: 'コスメ・香水・美容'},  {id: 8, category: '家電・スマホ・カメラ'}, 
#       {id: 9, category: 'スポーツ・レジャー'},  {id: 10, category: 'ハンドメイド'}, 
#       {id: 11, category: 'チケット'},           {id: 12, category: '自転車・オートバイ'}, 
#       {id: 13, category: 'その他'}
#   ]
#   self.data = [
#     {id: 1, category: 'レディース'},          {id: 2, category: 'メンズ'}, 
#     {id: 3, category: 'ベビー・キッズ'},      {id: 4, category: 'インテリア・住まい・小物'},
#     {id: 5, category: '本・音楽・ゲーム'},    {id: 6, category: 'おもちゃ・ホビー・グッズ'}, 
#     {id: 7, category: 'コスメ・香水・美容'},  {id: 8, category: '家電・スマホ・カメラ'}, 
#     {id: 9, category: 'スポーツ・レジャー'},  {id: 10, category: 'ハンドメイド'}, 
#     {id: 11, category: 'チケット'},           {id: 12, category: '自転車・オートバイ'}, 
#     {id: 13, category: 'その他'}
# ]
# end