class CategoriesController < ApplicationController
	#ajax
	def get_brand_by_cate_id
		brands = Category.where(category_id: params[:category_id])
		respond_to do |format|
			format.json {render :json => {brands: brands}}
		end #end respond
	end# end def

	def show_category_product
		category = Category.find(params[:id])
		if !category.category_ids.empty?
			cate_id = category.category_ids
			cate_id << category.id
		else
			cate_id = category.id
		end
		category_type_ids = category.type_ids
		if category_type_ids.empty?
			parent_category = Category.find(category.category_id)
			category_type_ids = parent_category.type_ids
		end
		@category_type = Type.where(id: category_type_ids)
		@products = Product.where(category_id: cate_id).newest.page params[:page]
    render 'products/index'
  end
end
