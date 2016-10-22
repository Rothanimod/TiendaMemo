class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'The product has been saved'
      redirect_to @product
    else
      @erros = @product.erros.full_messages
      render :new
    end
  end

  def edit
  end

  def index
  end

  def destroy
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :reference, :price, :quantity, :brand, :description)
  end
end
