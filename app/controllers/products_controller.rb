class ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page].to_i).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def sync
    ScrapingJob.perform_now
    redirect_to root_path, notice: 'Synchronization successful!'
  end
end
