class WelcomeController < ApplicationController
  def home
    @categories = Category.where(category_id: nil)
    @products = Product.all.page params[:page]
  end
end
