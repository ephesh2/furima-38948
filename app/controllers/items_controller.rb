# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: %i[new edit]
  before_action :find_item, only: %i[show edit update]

  def index
    @items = Item.includes(:user).order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit
    return unless current_user != @item.user

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :detail, :category_id, :item_status_id, :delivery_charge_id, :prefecture_id,
                                 :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
