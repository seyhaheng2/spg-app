class StoreController < ApplicationController
  
  def index
  	# @products = Product.order("published_at desc").limit(10)
  	@products = Product.text_search(params[:query]).paginate(:page => params[:page],per_page: 12)
  	# @products = Product.reorder("date DESC").page(params[:page]).per_page(10)
  end

  def about
  end

  def contact
  end

  def show
  	@product = Product.find(params[:product_id])
  end
end
