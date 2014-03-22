class DishesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: DishesDatatable.new(view_context) }
    end
  end  

  def new
    @dish = Dish.new
    if request.xhr?
      render partial: 'new_dish_modal'
    end  
  end

  def create
    @dish = Dish.new(params[:dish])
    @dish.save
    respond_with @dish
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update_attributes(params[:dish])
      flash[:success] = t('flash.dish', message: t('flash.updated'))
    end
    respond_with @dish
  end

end
