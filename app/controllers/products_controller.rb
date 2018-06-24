class ProductsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]

  def create
    product = Product.new(product_params)
    product.category_id = params[:category_id]
    product.save
    redirect_to category_path(product.category)
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to @products.category, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :category)
  end
end

def set_product
  @product = Product.find(params[:id])
end
