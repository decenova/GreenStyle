class OrderDetailsController < ApplicationController
  def create
    @order = current_order
    @order_detail = @order.order_details.new(order_details_params)
    @order.save
    session[:order_id] = @order.id
    puts "hehehhe: #{@order.id}"
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = @order.order_details
  end

  def destroy
  end

  private
  def order_details_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end
end
