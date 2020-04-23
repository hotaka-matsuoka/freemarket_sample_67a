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