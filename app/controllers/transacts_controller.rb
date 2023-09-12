class TransactsController < ApplicationController
  def show
    @transact = Transact.find_by(id: params[:id])
  end
end
