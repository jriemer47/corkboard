class Hire::CategoryController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

end
