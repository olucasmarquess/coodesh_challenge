class ProductsController < ApplicationController
  def show
    @product = Product.find_by(code: params[:code])
  end

  def index
    @products = Product.page(params[:page].to_i).per(10)
  end

  def sync
    ScrapingJob.perform_now
    redirect_to root_path, notice: 'Synchronization successful!'
  end
end
