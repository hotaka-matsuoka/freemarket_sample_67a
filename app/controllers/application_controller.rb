class ApplicationController < ActionController::Base
  # before_action :basic_auth
  # before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ransack, only: [:index, :show, :new, 'search']
  before_action :set_head_category_brand
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_ransack
    @q = Exhibition.ransack(params[:q])
  end

  def set_head_category_brand
    @top_categories = Category.where(ancestry: nil)
    @top_brands = Brand.all
    @category_chanel,@category_mens,@category_apple = Brand.find(1), Brand.find(2), Brand.find(17)
  end
end
