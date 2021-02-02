class ExhibitionsController < ApplicationController
  before_action :set_exhibition, except: [:index, :new, :create, 'get_category_children', 'get_category_grandchildren', 'get_size']
  before_action :set_category,   only:   [:new, :create]
  before_action :set_edit_array, only:   [:edit, :update]

  def index

  end

  def new
    @exhibition = Exhibition.new
    @exhibition.images.new
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to root_path, notice:"出品に成功しました"
    else
      @exhibition.images.new
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @exhibition.comments.includes(:user)
  end

  def edit
  end

  def update
    if @exhibition.user_id == current_user.id
      if @exhibition.update(exhibition_params)
        redirect_to exhibition_path(@exhibition)
      else
        render :edit
      end
    end
  end

  def destroy
    if @exhibition.user_id == current_user.id && @exhibition.destroy
      redirect_to root_path
    end
  end



  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    # 選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    if params[:parent_size_id].present?
      @sizes = Size.find_by(size: "#{params[:parent_size_id]}", ancestry: nil).children
    else
      selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
      if related_size_parent = selected_grandchild.sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
        @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
      else
        selected_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得
        if related_size_parent = selected_child.sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
            @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
        end
      end
    end
  end



  private

  def exhibition_params
    params.require(:exhibition).permit(:name, :explanation, :brand_name, :size_id, :price, :condition_id, :shipping_method_id, :shipping_date_id, :category_id, :prefecture_id, :salse_status, images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
    @favorites = Favorite.where(exhibition_id: @exhibition.id)
    @favorite = Favorite.find_by(user_id: current_user.id, exhibition_id: @exhibition.id) if signed_in?
  end
  def set_category
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def set_edit_array
    @selected_grandchild_category = @exhibition.category
    @category_grandchildren_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
      grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
      @category_grandchildren_array << grandchildren_hash
    end

    @selected_child_category = @selected_grandchild_category.parent
    @category_children_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_child_category.id}").siblings.each do |child|
      children_hash = {id: "#{child.id}", name: "#{child.name}"}
      @category_children_array << children_hash
    end

    @selected_parent_category = @selected_child_category.parent
    @category_parents_array = []
    Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
      @category_parents_array << parent.name
    end

    @selected_size = @exhibition.size
    @size_array = []
    Size.find(@selected_size.id).siblings.each do |size|
      category_hash = {id: "#{size.id}", name: "#{size.size}"}
      @size_array << category_hash
    end
  end

end
