class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:item_id, :postal_code, :prefecture_id, :municipality, :district, :building, :phone_number).merge(user_id: current_user.id)
  end
end
