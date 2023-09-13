class TransactsController < ApplicationController
  def show
    @transact = Transact.find_by(id: params[:id])
  end

  def new
    @new_transact = Transact.new
    @categories = current_user.categories
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    transact = Transact.new(user: current_user)
    transact.assign_attributes(transacts_params)
    categories_id.each do |id|
      transact.categories << Category.find_by(id: id)
    end
    
    if transact.save
      flash[:success] = 'The category was created!'
      redirect_to @category
    else
      flash.now[:error] = 'Could not create category, try again'
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def transacts_params
    params.require(:transact).permit(:name, :amount)
  end

  def categories_id
    params.require(:transact).permit(category_ids: [])[:category_ids] 
  end
end
