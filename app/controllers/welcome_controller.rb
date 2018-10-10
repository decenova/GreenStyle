class WelcomeController < ApplicationController
  def home
    @categories = Category.parent_cate
    @products = Product.all.page params[:page]
  end
end
