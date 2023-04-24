class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user != @item.user && @item.purchase.nil?
      @purchase_address = PurchaseAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        currency: 'jpy',
        card: purchase_address_params[:token]
      )
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :district, :building, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
