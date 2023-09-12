class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find_by(id: params[:id])
    @transacts = @category.transacts
  end

  def new
    @new_category = Category.new
  end

  def create
    category = Category.new(user: current_user)
    category.assign_attributes
  end

  private

  def categories_params
    p
  end
end
