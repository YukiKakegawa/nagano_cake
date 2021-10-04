class Public::OrdersController < ApplicationController

  before_action  :check_cart, only: [:new]


  def new
  	@order = Order.new
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:address_id] == "1"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
        @name ="#{current_customer.last_name}#{current_customer.first_name}"
       @order.name = @name


    elsif params[:order][:address_id] == "2"
      @order.postal_code = Address.find(params[:order][:address_select_id]).postal_code
      @order.address = Address.find(params[:order][:address_select_id]).address
      @order.name = Address.find(params[:order][:address_select_id]).nam
    end

    @cart_items = current_customer.cart_items
  end


  def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
       order_item = OrderItem.new
       order_item.item_id = cart_item.item_id
       order_item.order_id = @order.id
       order_item.price = cart_item.item.price
       order_item.amount = cart_item.amount
       order_item.making_status = "着手不可"
       order_item.save
    end
    redirect_to orders_complete_path
    @cart_items.destroy_all
  end

  def complete
  end

private
  def order_params
    params.require(:order).permit(:payment_method, :total_payment, :name, :address, :postal_code, :customer_id)
  end

  def check_cart
    if current_customer.cart_items.blank?
      redirect_to cart_items_path
    end

  end

end
