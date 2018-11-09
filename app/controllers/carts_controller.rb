class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  #ajax
  def add_to_cart
    respond_to do |format|
      if current_user
        total_price = params[:total_price]
        my_cart = params[:my_cart]
        order = Order.new(user_id: current_user.id, total_price: total_price)
        if order.save
          my_cart.each do |key, value|
              order_detail = OrderDetail.create(order_id: order.id,
                 product_id: value["productId"], quantity: value["quantity"], price: value["price"])
          end
          format.json {render :json => {noti: "Mua hàng thành công", flag: true}}
        else   
          puts @order.errors.details
          format.json {render :json => {noti: "Mua hàng thất bại", flag: false}}
        end
      else
        format.json {render :json => {noti: "Bạn cần phải đăng nhập.", flag: false}}
      end 
    end#end respond
  end
  def order_params
    params.require(:order).permit(:user_id, :total_price, :order_date)
  end
end
