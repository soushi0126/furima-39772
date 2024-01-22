class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(
      :post_code, :prefecture_id, :municipalities, 
      :street_address, :building, :telephone
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end