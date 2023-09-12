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
    category.assign_attributes(categories_params)
    if category.save 
        redirect_to categories_path
        flash[:success] = 'The category was created!'
    else 
        flash.now[:error] = 'Could not create category, try again'
        render :new, status: :unprocessable_entity
    end
end

private 

def categories_params
    params.require(:category).permit(:name, :icon)
end
end
