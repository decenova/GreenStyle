class WelcomeController < ApplicationController
  def home
    @categories = Category.parent_cate
    @products = Product.all.newest.page params[:page]
  end
end
