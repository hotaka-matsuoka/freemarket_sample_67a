class ExhibitionsController < ApplicationController
  before_action :set_exhibition, except: [:index, :new, :create, 'get_category_children','get_category_grandchildren','get_size']
  before_action :set_category  , only: [:new, :create, :edit]
  
  def index
    @exhibitions = Exhibition.includes(:images).order('created_at DESC')
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
      redirect_to new_exhibition_path, notice:"出品に失敗しました"
    end
  end

  def show
  end


  def edit
  end

  def update
    if @exhibition.user_id == current_user.id && @exhibition.update(exhibition_params)
      redirect_to exhibitions_path
    else
      render :edit
    end
  end

  def destroy
    if @exhibition.user_id == current_user.id && @exhibition.destroy
      redirect_to exhibitions_path
    else
      render :new
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

  private

  def exhibition_params
    params.require(:exhibition).permit(:name, :explanation, :brand_name, :size_id, :price, :condition_id, :shipping_method_id, :shipping_date_id, :category_id, :prefecture_id, :salse_status, images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
  def set_category
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end
end
