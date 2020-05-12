class BrandsController < ApplicationController
  before_action :set_brand  , only: :show
  def index 
    categories, categories_ids, array, @categories = [],[],[],[]
    category_list = ["レディース","メンズ","ベビー・キッズ","インテリア・住まい・小物","キッチン/食品","時計","コスメ・香水・美容","家電・スマホ・カメラ","スポーツ・レジャー","スマートフォン/携帯電話","バイクウエア/装備","自動車タイヤ/ホイール","食器","国内自動車本体","外国自動車本体"]
    category_list.each do |category_name|
      if Category.find_by(name: category_name).blank?
        categories << nil
      else
        categories << Category.find_by(name: category_name)
      end
    end
    categories.each do |category|
      if category.blank?
        array << nil
      else
        array << category.id
        array << category.child_ids if category.has_children?
        array << category.indirect_ids unless category.indirect_ids.blank?
        categories_ids << array.flatten
      end
      array = []
    end
    categories_ids.each do |ids|
      if ids.blank?
        @categories << nil 
      else
        @categories << CategoryBrand.includes(:category,:brand).where(category_id: ids)
      end
    end
  end
  
  def show

  end

  private
  
  def set_brand
    brand = Brand.find(params[:id])
    @category_brand = CategoryBrand.includes(:category,:brand).where(brand_id:brand.id).order(id: :asc)
    @products = Exhibition.includes(:images).where(brand_name: brand.brand).order(created_at: :desc).page(params[:page]).per(1)
  end
end
