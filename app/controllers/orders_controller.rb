class OrdersController < ApplicationController
  
  def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])

   if @order_address.valid?
    @order_address.save
    redirect_to items_path
   else
    render 'orders/index'
    end
  end

  private

  def address_params
    params.require(:order_address).permit(
      :city, 
      :address, 
      :prefecture_id, 
      :postal_code, 
      :building_name, 
      :phone_number, 
      :order_id)
      .merge(user_id: current_user.id, item_id: params[:item_id])
  end


end