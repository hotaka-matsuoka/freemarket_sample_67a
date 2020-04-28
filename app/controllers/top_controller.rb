class TopController < ApplicationController
  
  def index
    @redies,@mens,@electrical,@kids,@chanel,@nike,@apple = [],[],[],[],[],[],[]
    Exhibition.includes([:images, :category]).order(created_at: :desc).each do |product|
      break if @redies.length == 2 && @mens.length == 2 && @kids.length == 0
      if product.category.parent.parent_id == 1
        @redies << product 
      elsif product.category.parent.parent_id == 200
        @mens << product
      elsif product.category.parent.parent_id == 279
        @electrical << product
      elsif product.category.parent.parent_id == 211
        @kids << product
      end
    end
    Exhibition.includes([:images]).order(created_at: :desc).each do |product|
      if product.brand_name == Brand.find(1).brand
        @chanel << product
      elsif product.brand_name == Brand.find(2).brand
        @nike << product
      elsif product.brand_name == Brand.find(17).brand
        @apple << product
      end
    end
  end


end