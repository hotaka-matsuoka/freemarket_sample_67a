class TopController < ApplicationController
  before_action :set_category,   only: "search"
  before_action :set_size,       only: "search"
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
    Exhibition.includes(:images).order(created_at: :desc).each do |product|
      if product.brand_name == @category_chanel.brand
        @chanel << product
      elsif product.brand_name == @category_mens.brand
        @nike << product
      elsif product.brand_name == @category_apple.brand
        @apple << product
      end
    end
  end

  def search
    if params[:q].nil?
      params[:q] = Hash.new
    end
      @selected_category = params[:q][:category_id_in].deep_dup if params[:q][:category_id_in].present?
      @selected_size = params[:q][:size_id_in].deep_dup if params[:q][:size_id_in].present?

      if params[:q][:category_id_in] != [""] && params[:q][:category_id_in].present?
        if params[:q][:category_id_in].length > 2
          @selected_child_category = params[:q][:category_id_in].slice(1)
          params[:q][:category_id_in].slice!(0..1)
          @selected_grandchild_category = params[:q][:category_id_in].deep_dup
        elsif params[:q][:category_id_in].length == 2
          params[:q][:category_id_in].slice!(0)
          if params[:q][:category_id_in][0] =~ /[0-9]+/
            @selected_child_category = params[:q][:category_id_in][0].deep_dup
              params[:q][:category_id_in]  = Category.find(params[:q][:category_id_in][0]).child_ids if Category.find(params[:q][:category_id_in][0]).has_children?
          else
            category = Category.find_by(ancestry: nil ,name:params[:q][:category_id_in])
            params[:q][:category_id_in] = category.child_ids if category.child_ids.present?
            params[:q][:category_id_in] << category.indirect_ids if category.indirect_ids.present?
            params[:q][:category_id_in].flatten!
          end
        else
          category = Category.find_by(ancestry: nil ,name:params[:q][:category_id_in])
            params[:q][:category_id_in] = category.child_ids if category.child_ids.present?
            params[:q][:category_id_in] << category.indirect_ids if category.indirect_ids.present?
            params[:q][:category_id_in].flatten!
        end
      end

      if params[:q][:size_id_in] != [""] && params[:q][:size_id_in].present?
        if params[:q][:size_id_in].length > 1
          params[:q][:size_id_in].slice!(0)
        else
          params[:q][:size_id_in]  = Size.find_by(ancestry: nil ,size:params[:q][:size_id_in]).child_ids
        end
      end
      
      @q = Exhibition.ransack(params[:q])
      if @q.name_cont.present?
        @q.name_cont = @q.name_cont.gsub(/[[:space:]]/, '').tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
        @products = @q.result(distinct: true)
        @products = Kaminari.paginate_array(@products).page(params[:page]).per(12)
      else
        @no_name_cont_products = @q.result(distinct: true)
        @no_name_cont_products = Kaminari.paginate_array(@no_name_cont_products).page(params[:page]).per(12)
      end
    @notfound_products = Exhibition.includes(:images).order(created_at: :desc).page(params[:page]).per(12) if @products.blank? && @no_name_cont_products.blank?
  end
  private 
  def set_category
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def set_size
    @size_parent_array = []
    Size.where(ancestry: nil).each do |size_parent|
      @size_parent_array << size_parent.size
    end
  end
end