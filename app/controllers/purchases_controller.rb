class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipalities, 
                                              :street_address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
