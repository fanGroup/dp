class DishesController < ApplicationController

  respond_to :html, :json
  before_filter :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json do
        if params[:q].present?
          data = Dish.where("name ILIKE :search or
                                  description ILIKE :search",
                                  search: "%#{params[:q]}%")  
        else
          data = DishesDatatable.new(view_context)
        end
        render json: data
      end    
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
    if request.xhr?
      render partial: 'edit_dish_modal'
    end 
  end

  def update
    @dish = Dish.find(params[:id])
    @dish.update_attributes(params[:dish])
    respond_with @dish
  end

end
