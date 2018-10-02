class StaticPagesController < ApplicationController
  def home
    @hot = Product.all.take(12)
  end
end
