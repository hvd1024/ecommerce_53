class ProductsController < ApplicationController
  before_action :load_product, only: [:show]

  def show
    @ratings = Rating.product_rating(@product.id)
    length = @ratings.count
    sum = 0

    for i in 0...length
      sum += @ratings[i].rating
    end

    if length <= 0
      @starton = 0
      @startoff = 5
    else
      @starton = (sum/length).round
      @startoff = 5-@starton
    end
  end

  def rating
    check_login_demo

    update = Rating.find_by(user_id: params[:user_id],
      product_id: params[:id])

    if update.blank?
      Rating.create!(user_id: update.user_id,
       product_id: update.product_id, rating: params[:point])
    else
      update.update_attributes(rating: params[:point])
    end

    flash[:success] = "Bạn đã dánh giá #{params[:point]} sao."
    redirect_to params[:old]
  end

  def check_login_demo
    
  end

  private
  def load_product
    @product = Product.find_by(id: params[:id])
  end
end
