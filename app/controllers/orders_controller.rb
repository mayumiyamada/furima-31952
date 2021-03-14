class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_toppage, only: [:index, :create] 

  def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
   if @order_address.valid?
    pay_item
    @order_address.save
    redirect_to root_path
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
      .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

    def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def move_to_toppage
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id == @item.order
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,
      card: address_params[:token],    
      currency: 'jpy'              
    )
  end

end