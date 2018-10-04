class TypesController < ApplicationController
	#ajax
	def get_type_by_cate_id
		category = Category.find_by_id(params[:category_id])
		cate_types = category.types
		respond_to do |format|
			format.json {render :json => {cate_types: cate_types}}
		end
	end

	def get_subtype_by_type_id
		subtypes = Type.where(type_id: params[:type_id])
		respond_to do |format|
			format.json {render :json => {subtypes: subtypes}}
		end
	end
end
