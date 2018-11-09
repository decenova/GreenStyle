class WelcomeController < ApplicationController
  def home
    @categories = Category.parent_cate
    @products = Product.order("RANDOM()").all.page params[:page]
  end
end
