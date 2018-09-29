class WelcomeController < ApplicationController
  def home
    @categories = Category.where(category_id: nil)
  end
end
