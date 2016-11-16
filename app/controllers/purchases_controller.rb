class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :its_admin?, only: [ :update, :dashboard, :destroy ]

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
    @users = User.all
  end

  def update
    purchase = Purchase.find(params[:id])
    if purchase.update(status: :paid)
      flash[:notice] = 'Compra pagada con exito'
    else
      flash[:alert] = 'No ha sido posible pagar la compra, intenta de nuevo'
    end
    redirect_to profile_path(id: params[:user_id])
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:notice] = 'Tu Compra ha sido eliminada satisfactoriamente'
    redirect_to profile_path(id: params[:user_id])
  end

  private
  def its_admin?
    unless current_user.admin?
      redirect_to root_path, :alert => "Acceso denegado, no posee permisos como administrador"
    end
  end

end
