class CategoriesController < ApplicationController


  def show
    @category = Category.find(params[:id])
    @products = @category.categories.order(created_at: :desc)
  end

end
