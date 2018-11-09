class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def show
   
  end
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
          format.json {render :json => {noti: "Success"}}
        else   
          puts @order.errors.details
          format.json {render :json => {noti: "Fail"}}
        end
      else
        format.html {render 'index'}
        format.json {render :json => {band: band}}
      end 
    end#end respond
  end
  def order_params
    params.require(:order).permit(:user_id, :total_price, :order_date)
  end
end
