class CategoriesController < ApplicationController
  before_action :set_category  , only: :show
  def index
    @categories = Category.where(ancestry: nil)
  end
  
  def show

  end

  private
  
  def set_category
    category = Category.find(params[:id])
    category_child,category_grandchild = category.child_ids,category.indirect_ids
    @products = Exhibition.includes(:images, :category).where(category_id:category_grandchild)
  end
end
