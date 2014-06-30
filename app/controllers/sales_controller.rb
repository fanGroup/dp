class SalesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: SalesDatatable.new(view_context) }
    end
  end  

  def new
    @sale = Sale.new
    if request.xhr?
      render partial: 'new_sale_modal'
    end  
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.save
    respond_with @sale
  end

  def show
    @sale = Sale.find(params[:id])
  end
  
  def edit
    @sale = Sale.find(params[:id])
    if request.xhr?
      render partial: 'edit_sale_modal'
    end 
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update_attributes(params[:sale])
    respond_with @sale
  end

end
