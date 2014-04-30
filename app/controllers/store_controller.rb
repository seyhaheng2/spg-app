class StoreController < ApplicationController
  before_filter :authenticate_user!,  except: [:index, :show]
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
       def previous
        Product.where(["id < ?", id]).last
      end
      def next
        Product.where(["id > ?", id]).first
      end
end
