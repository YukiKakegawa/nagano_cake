class Admin::OrderItemsController < ApplicationController

  def update
   @order_item = OrderItem.find(params[:id])
   @order_item.making_status = params[:order_item][:making_status]
   @order_item.update(order_item_params)
   @order = @order_item.order

   if @order_item.making_status == "製作中"
     @order.update(status: "製作中")
   end

   if @order_item.order.order_items.all?{|order_item| order_item.making_status == "製作完了"}
     @order.update(status: "発送準備中")
   end
   redirect_to admin_order_path(@order)
  end

  private
   def order_item_params
       params.require(:order_item).permit(:making_status)
   end
end
