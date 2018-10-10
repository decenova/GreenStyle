class CategoriesController < ApplicationController
	#ajax
	def get_brand_by_cate_id
		brands = Category.where(category_id: params[:category_id])
		respond_to do |format|
			format.json {render :json => {brands: brands}}
		end #end respond
	end# end def
end
