class UsersController < ApplicationController
  def index
    return unless current_user

    redirect_to categories_path
  end
end
