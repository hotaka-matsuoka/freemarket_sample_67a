class TopController < ApplicationController
  
  def index
    @categories = Category.where(ancestry: nil)
    @brands = Brand.all
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
    @category_chanel,@category_mens,@category_apple = Brand.find(1), Brand.find(2), Brand.find(17)
    Exhibition.includes([:images]).order(created_at: :desc).each do |product|
      if product.brand_name == @category_chanel.brand
        @chanel << product
      elsif product.brand_name == @category_mens.brand
        @nike << product
      elsif product.brand_name == @category_apple.brand
        @apple << product
      end
    end
  end
end