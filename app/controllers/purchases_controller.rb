class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    product = Product.find(params[:product_id])
    purchase = Purchase.new
    purchase.product = product
    purchase.user = current_user
    purchase.status = :pending
    purchase.price = product.price

    if product.available? && purchase.save
      product.update_stock
      flash[:notice] = 'Tu compra ha sido realizada con exito'
    else
      flash[:alert] = 'No se ha podido realizar la compra, intenta de nuevo'
    end
    redirect_to root_path(category_id: product.category_id)

  end

  def dashboard
    @users = User.where(role: :client)
  end

end
