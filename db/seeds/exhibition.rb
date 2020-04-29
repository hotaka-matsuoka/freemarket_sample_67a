def create_product(name, price, brand_name,size_id,category_id)
  product = Exhibition.create(name: name, explanation: "商品の説明", price: price, brand_name: brand_name, shipping_method_id: 1, shipping_date_id: 1,  size_id: size_id, condition_id: 1, prefecture_id: 1, category_id: category_id, user_id: 1,sales_status:0)
end


name = "レディース1"     ;price = 3700;brand_name = "シャネル";size_id = 2 ;category_id = 3 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース2"     ;price = 3500;brand_name = "シャネル";size_id = 3 ;category_id = 4 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース3"     ;price = 3000;brand_name = "シャネル";size_id = 4 ;category_id = 5 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース4"     ;price = 3700;brand_name = "シャネル";size_id = 5 ;category_id = 6 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース5"     ;price = 3600;brand_name = "シャネル";size_id = 13 ;category_id = 68  ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース6"     ;price = 3200;brand_name = "シャネル";size_id = 1;category_id = 96 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース7"     ;price = 3500;brand_name = "ナイキ";size_id = 13 ;category_id = 71 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース8"     ;price = 3000;brand_name = "ナイキ";size_id = 13 ;category_id = 71 ;create_product(name, price, brand_name, size_id,category_id)
name = "レディース9"     ;price = 3300;brand_name = "ナイキ";size_id = 14;category_id = 71 ;create_product(name, price, brand_name, size_id,category_id)
name = "メンズ1"        ;price =25000 ;brand_name = "ナイキ";size_id = 4;category_id = 202;create_product(name, price, brand_name, size_id,category_id)
name = "メンズ2"        ;price =3200 ;brand_name = "ナイキ";size_id = 5;category_id = 202;create_product(name, price, brand_name, size_id,category_id)
name = "メンズ3"        ;price =3100 ;brand_name = "ナイキ";size_id = 6;category_id = 202;create_product(name, price, brand_name, size_id,category_id)
name = "ベビーキッズ1"   ;price =2000 ;brand_name = "ナイキ";size_id = 2;category_id =213 ;create_product(name, price, brand_name, size_id,category_id)
name = "ベビーキッズ2"   ;price =1200 ;brand_name = "ナイキ";size_id = 2;category_id =213 ;create_product(name, price, brand_name, size_id,category_id)
name = "ベビーキッズ3"   ;price =1500 ;brand_name = "ナイキ";size_id = 2;category_id =217 ;create_product(name, price, brand_name, size_id,category_id)
name = "スマートフォン1"        ;price =9000 ;brand_name = "アップル";size_id =1 ;category_id =281 ;create_product(name, price, brand_name, size_id,category_id)
name = "スマートフォン2"        ;price =8000 ;brand_name = "アップル";size_id =1 ;category_id =281 ;create_product(name, price, brand_name, size_id,category_id)
name = "スマートフォン3"         ;price =10000 ;brand_name = "アップル";size_id =1 ;category_id =281 ;create_product(name, price, brand_name, size_id,category_id)

def create_image(image_url_array,exhibition_id)
  image_url_array.each do |image_url|
      images = Image.create(image_url:open(image_url), exhibition_id: exhibition_id)
  end
end

image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m40554531756_2.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_3.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_2.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_4.jpg?1586446981",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_2.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_4.jpg?1586446981",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_2.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_1.jpg?1585394597",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_5.jpg?1586446981",
                 "https://static.mercdn.net/item/detail/orig/photos/m40554531756_6.jpg?1586446981"]
exhibition_id = 1
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m99198955070_1.jpg?1587104317",
                 "https://static.mercdn.net/item/detail/orig/photos/m99198955070_2.jpg?1587104317"]
exhibition_id = 2
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m99198955070_2.jpg?1587104317"]
exhibition_id =3
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m59821969560_1.jpg?1562330620",
                 "https://static.mercdn.net/item/detail/orig/photos/m59821969560_2.jpg?1562330620",
                "https://static.mercdn.net/item/detail/orig/photos/m59821969560_3.jpg?1562330620"]
exhibition_id = 4
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m32866569062_1.jpg?1587739048"]
exhibition_id = 5
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m83717835950_1.jpg?1587632508",
                 "https://static.mercdn.net/item/detail/orig/photos/m83717835950_2.jpg?1587632508",
                 "https://static.mercdn.net/item/detail/orig/photos/m83717835950_4.jpg?1587632508"]
exhibition_id = 6
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m17815722940_1.jpg?1587825753"]
exhibition_id = 7
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m90821794025_3.jpg?1587783295",
                "https://static.mercdn.net/item/detail/orig/photos/m90821794025_2.jpg?1587783295"]
exhibition_id = 8
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m31417461952_1.jpg?1585954740",
                 "https://static.mercdn.net/item/detail/orig/photos/m31417461952_2.jpg?1585954740"]
exhibition_id =9
create_image(image_url_array,exhibition_id) 
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m89052254838_1.jpg?1587825522",
                "https://static.mercdn.net/item/detail/orig/photos/m89052254838_3.jpg?1587825522"]
exhibition_id = 10
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m72815052045_1.jpg?1586686032"]
exhibition_id = 11
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m69451682121_1.jpg?1586699450"]
exhibition_id =12
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m79630771763_1.jpg?1587825291"]
exhibition_id =13
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m80493025286_1.jpg?1586576100"]
exhibition_id =14
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m12213690800_1.jpg?1587805429"]
exhibition_id =15
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m85689564873_1.jpg?1587826173"]
exhibition_id = 16
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m48556294445_1.jpg?1587826195",
                 "https://static.mercdn.net/item/detail/orig/photos/m48556294445_2.jpg?1587826195"]
exhibition_id = 17
create_image(image_url_array,exhibition_id)
image_url_array = ["https://static.mercdn.net/item/detail/orig/photos/m91801227002_1.jpg?1587822262",
                 "https://static.mercdn.net/item/detail/orig/photos/m91801227002_2.jpg?1587822262",
                 "https://static.mercdn.net/item/detail/orig/photos/m91801227002_7.jpg?1587822262"]
exhibition_id = 18
create_image(image_url_array,exhibition_id)