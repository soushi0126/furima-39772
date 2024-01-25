class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
    set_payjp_public_key
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      set_payjp_public_key
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.require(:purchase_address).permit(
      :post_code, :prefecture_id, :municipalities,
      :street_address, :building, :telephone
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_payjp_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def redirect_if_seller
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id || @item.purchase.present?
  end
end
