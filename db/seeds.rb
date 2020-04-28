#category.rb
#レディースブロック

#レディースの子カテゴリー配列
lady_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
#レディースの孫カテゴリー配列
lady_grandchild_array = [['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'],
                         ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'], 
                         ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], 
                         ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], 
                         ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
                         ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
                         ['パジャマ','ルームウェア'], 
                         ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
                         ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
                         ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
                         ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
                         ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], 
                         ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
                         ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
                         ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], 
                         ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
                         ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
                         ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
                         ['コスプレ','下着','その他']]

parent = Category.create(name: 'レディース')
lady_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  lady_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

#メンズブロック

#メンズの子カテゴリー配列
mens_child_array = ['トップス','ジャケット/アウター','その他']
#メンズの孫カテゴリー配列
mens_grandchild_array = [['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','その他'],
                         ['テーラードジャケット','ノーカラージャケット','その他'],
                         ['']]

parent = Category.create(name: 'メンズ')
mens_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  mens_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#ベビー・キッズブロック

#ヘビー・キッズの子カテゴリー配列
baby_kids_child_array = ['ベビー服','キッズ服','キッズ靴','その他']
#ベビー・キッズの孫カテゴリー配列
baby_kids_grandchild_array = [['トップス','アウター','その他'],
                              ['コート','ジャケット/上着','その他'],
                              ['スニーカ','サンダル','その他'],
                              ['母子手帳用品','その他']]

parent = Category.create(name: 'ベビー・キッズ')
baby_kids_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  baby_kids_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#インテリア・住まい・小物ブロック

#インテリア・住まい・小物の子カテゴリー配列
interior_house_accessories_child_array = ['キッチン/食品','ベッド/マットレス','その他']
#インテリア・住まい・小物の孫カテゴリー配列
interior_house_accessories_grandchild_array = [['食器','調理器具','その他'],
                                               ['セミシングルベッド','シングルベッド','その他'],
                                               ['ソファセット','シングルソファ','ラブソファ']]

parent = Category.create(name: 'インテリア・住まい・小物')
interior_house_accessories_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  interior_house_accessories_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#本・音楽・ゲームブロック

#本・音楽・ゲームの子カテゴリー配列
book_music_game_child_array = ['本','CD','テレビゲーム']
#本・音楽・ゲームの孫カテゴリー配列
book_music_game_grandchild_array = [['文学/小説','人文/社会','その他'],
                                    ['邦楽','洋楽','その他'],
                                    ['家庭用ゲーム本体','家庭用ゲームソフト','その他']]

parent = Category.create(name: '本・音楽・ゲーム')
book_music_game_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  book_music_game_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#おもちゃ・ホビー・グッズブロック

#おもちゃ・ホビー・グッズの子カテゴリー配列
toy_hobby_goods_child_array = ['おもちゃ','タレントグッズ','その他']
#おもちゃ・ホビー・グッズの孫カテゴリー配列
toy_hobby_goods_grandchild_array = [['キャラクターグッズ','ぬいぐるみ','小物/アクセサリー'],
                                    ['アイドル','ミュージシャン','その他'],
                                    ['トランプ/UNO','カルタ/百人一首','その他']]

parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
toy_hobby_goods_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  toy_hobby_goods_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#コスメ・香水・美容ブロック

#コスメ・香水・美容の子カテゴリー配列
cosmetics_perfume_beauty_child_array = ['ベースメイク','メイクアップ','その他']
#コスメ・香水・美容の孫カテゴリー配列
cosmetics_perfume_beauty_grandchild_array = [['ファンデーション','化粧下地','その他'],
                                             ['アイシャドウ','口紅','その他'],
                                             ['健康食品','看護/介護用品','その他']]

parent = Category.create(name: 'コスメ・香水・美容')
cosmetics_perfume_beauty_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  cosmetics_perfume_beauty_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#家電・スマホ・カメラブロック

#家電・スマホ・カメラの子カテゴリー配列
appliance_phone_camera_child_array = ['スマートフォン/携帯電話','スマホアクセサリー','その他']
#家電・スマホ・カメラの孫カテゴリー配列
appliance_phone_camera_grandchild_array = [['スマートフォン本体','バッテリー/充電器','その他'],
                                           ['Android用ケース','iPhone用ケース','その他'],
                                           ['その他']]

parent = Category.create(name: '家電・スマホ・カメラ')
appliance_phone_camera_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  appliance_phone_camera_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#スポーツ・レジャーブロック

#スポーツ・レジャーの子カテゴリー配列
sport_leisure_child_array = ['ゴルフ','フィッシング','その他']
#スポーツ・レジャーの孫カテゴリー配列
sport_leisure_grandchild_array = [['クラブ','ウエア','その他'],
                                  ['ロッド','リール','その他'],
                                  ['旅行用品','その他']]

parent = Category.create(name: 'スポーツ・レジャー')
sport_leisure_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  sport_leisure_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#ハンドメイドブロック

#ハンドメイドの子カテゴリー配列
handmade_child_array = ['アクセサリー（女性用）','ファッション/小物','その他']
#ハンドメイドの孫カテゴリー配列
handmade_grandchild_array = [['ピアス','イヤリング','その他'],
                             ['バッグ（女性用）','バッグ（男性用）','その他'],
                             ['']]

parent = Category.create(name: 'ハンドメイド')
handmade_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  handmade_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#チケットブロック

#チケットの子カテゴリー配列
ticket_child_array = ['音楽','スポーツ','その他']
#チケットの孫カテゴリー配列
ticket_grandchild_array = [['男性アイドル','女性アイドル','その他'],
                           ['サッカー','野球','その他'],
                           ['']]

parent = Category.create(name: 'チケット')
ticket_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  ticket_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#自転車・オートバイブロック

#自転車・オートバイの子カテゴリー配列
bicycle_motorcycle_child_array = ['自動車本体','自動車タイヤ/ホイール','オートバイアクセサリー']
#自転車・オートバイの孫カテゴリー配列
bicycle_motorcycle_grandchild_array = [['国内自動車本体','外国自動車本体'],
                                       ['タイヤ/ホイールセット','タイヤ','その他'],
                                       ['ヘルメット/シールド','バイクウエア/装備','その他']]

parent = Category.create(name: '自転車・オートバイ')
bicycle_motorcycle_child_array.each_with_index do |child, i|
  child = parent.children.create(name: child)
  bicycle_motorcycle_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end


#その他ブロック

#その他の子カテゴリー配列
other_child_array = ['ペット用品','食品','その他']
#その他の孫カテゴリー配列
other_grandchild_array = [['ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他'], 
                          ['菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他'], 
                          ['']]

parent = Category.create(name: 'その他')
other_child_array.each_with_index do |child,i|
  child = parent.children.create(name: child)
  other_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

#brand.rb
brands = ['アーヴェヴェ','アーカイバ',  #レディース　メンズ　ベビー・キッズ
  'イーセンアーレン','イイホシユミコ',  #インテリア・住まい・雑貨
  'ヴィーニャ','ヴィノグランデ',  #キッチン・食器
  'エクストララージ','エテルナ',  #時計
  'オイセサン','オー',  #コスメ・香水・美容
  'ウィー','ウィーユー',  #テレビゲーム
  'カースル','カシオ',  #家電・スマホ
  'キザキ','キャットアイ',  #スポーツ・レジャー
  'アップル','コヴィア',  #スマートフォン・携帯電話
  'チョーヤ梅酒','鍋島',  #食品
  'ホンダ','マツダ',  #国内自動車本体
  'フィアット','フェラーリ']  #外国自動車本体

brands.each do |brand|
brand = Brand.create(brand: brand)
end

#size.rb
parent1    = Size.create(size: "サイズ")

child1_1   = parent1.children.create(size: "XSS以下")
child1_2   = parent1.children.create(size: "XS(SS)")
child1_3   = parent1.children.create(size: "S")
child1_4   = parent1.children.create(size: "M")
child1_5   = parent1.children.create(size: "L")
child1_6   = parent1.children.create(size: "XL(LL)")
child1_7   = parent1.children.create(size: "2XL(3L)")
child1_8   = parent1.children.create(size: "3XL(4L)")
child1_9   = parent1.children.create(size: "4XL(5)以上")
child1_10  = parent1.children.create(size: "FREE SIZE")


parent2    = Size.create(size: "サイズ(cm)")

child2_1   = parent2.children.create(size: "23.5cm以下")
child2_2   = parent2.children.create(size: "24cm")
child2_3   = parent2.children.create(size: "24.5cm")
child2_4   = parent2.children.create(size: "25cm")
child2_5   = parent2.children.create(size: "25.5cm")
child2_6   = parent2.children.create(size: "26cm")
child2_7   = parent2.children.create(size: "26.5cm")
child2_8   = parent2.children.create(size: "27cm")
child2_9   = parent2.children.create(size: "27.5cm")
child2_10  = parent2.children.create(size: "28cm")
child2_11  = parent2.children.create(size: "28.5cm")
child2_12  = parent2.children.create(size: "29cm")
child2_13  = parent2.children.create(size: "29.5cm")
child2_14  = parent2.children.create(size: "30cm")
child2_15  = parent2.children.create(size: "30.5cm")
child2_16  = parent2.children.create(size: "31cm以上")

#category_brand.rb
def create_category_brand(category_id,brand_ids)
  brand_ids.each do |brand_id|
    category_brand = CategoryBrand.create(category_id:category_id,brand_id:brand_id)
  end
end

brand_ids = (1..2)
category_id = 1
create_category_brand(category_id,brand_ids)

brand_ids = (1..2)
category_id = 200
create_category_brand(category_id,brand_ids)

brand_ids = (1..2)
category_id = 211
create_category_brand(category_id,brand_ids)

brand_ids = (3..4)
category_id = 226
create_category_brand(category_id,brand_ids)

brand_ids = (5..6)
category_id = 227
create_category_brand(category_id,brand_ids)

brand_ids = (7..8)
category_id = 155
create_category_brand(category_id,brand_ids)

brand_ids = (9..10)
category_id = 265
create_category_brand(category_id,brand_ids)

brand_ids = (11..12)
category_id = 248
create_category_brand(category_id,brand_ids)

brand_ids = (13..14)
category_id = 278
create_category_brand(category_id,brand_ids)

brand_ids = (15..16)
category_id = 289
create_category_brand(category_id,brand_ids)

brand_ids = (17..18)
category_id = 279
create_category_brand(category_id,brand_ids)

brand_ids = (19..20)
category_id = 335
create_category_brand(category_id,brand_ids)

brand_ids = (21..22)
category_id = 325
create_category_brand(category_id,brand_ids)

brand_ids = (23..24)
category_id = 326
create_category_brand(category_id,brand_ids)

#category_size.rb


def create_category_sizes(category_ids,size_id)
  category_ids.each do |category_id|
    category_size = CategorySize.create(category_id:category_id,size_id:size_id)
  end
end

category_ids = (3..20)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (22..42)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (44..55)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (57..61)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (63..66)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (68..77)
size_id = 12
create_category_sizes(category_ids,size_id)

category_ids = (79..80)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (179..181)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (187..195)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (202..204)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (206..208)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (213..215)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (217..219)
size_id = 1
create_category_sizes(category_ids,size_id)

category_ids = (221..223)
size_id = 12
create_category_sizes(category_ids,size_id)
