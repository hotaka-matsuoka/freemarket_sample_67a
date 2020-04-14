
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