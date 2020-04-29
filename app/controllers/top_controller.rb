class TopController < ApplicationController
  
  def index
    @redies,@mens,@electrical,@kids,@chanel,@nike,@apple = [],[],[],[],[],[],[]
    Exhibition.includes([:images, :category]).order(created_at: :desc).each do |product|
      break if @redies.length == 2 && @mens.length == 2 && @kids.length == 0
      if product.category.parent.parent_id == 1 || product.category.parent_id == 1
        @redies << product 
      elsif product.category.parent.parent_id == 200 || product.category.parent_id == 200
        @mens << product
      elsif product.category.parent.parent_id == 279 || product.category.parent_id == 279
        @electrical << product
      elsif product.category.parent.parent_id == 211 || product.category.parent_id == 211
        @kids << product
      end
    end
    chanel_id,mens_id,apple_id = Brand.find(1).brand,Brand.find(2).brand,Brand.find(17).brand
    Exhibition.includes([:images]).order(created_at: :desc).each do |product|
      if product.brand_name == chanel_id
        @chanel << product
      elsif product.brand_name == mens_id
        @nike << product
      elsif product.brand_name == apple_id
        @apple << product
      end
    end
  end
end