class CategoriesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def new
    @category = Category.new
    if request.xhr?
      render partial: 'new_category_modal'
    end  
  end

  def create
    @category = Category.new(params[:category])
      respond_with @category if @category.save
  end

end
