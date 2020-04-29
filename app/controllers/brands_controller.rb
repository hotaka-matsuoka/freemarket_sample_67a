class BrandsController < ApplicationController
  before_action :set_brand  , only: :show
  def index
    @brands = Brand.all
  end
  
  def show

  end

  private
  
  def set_brand
    brand = Brand.find(params[:id])
    @products = Exhibition.includes(:images).where(brand_name: brand.brand)
  end
end
