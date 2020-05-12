class CategoriesController < ApplicationController
  before_action :set_category  , only: :show
  def index
    @categories = Category.where(ancestry: nil)
  end
  
  def show

  end

  private
  
  def set_category
    @category = Category.find(params[:id])
    category_id=[]
    category_id << @category unless @category.children?
    category_id << @category.child_ids unless @category.child_ids.blank?
    category_id << @category.indirect_ids unless @category.indirect_ids.blank?
    category_id.flatten!
    @products = Exhibition.includes(:images, :category).where(category_id:category_id).page(params[:page]).per(5)
  end
end
