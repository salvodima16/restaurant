class PaperRowsController < ApplicationController
  def index
    @paper_row = PaperRow.all
  end

  def show
    @paper_row = PaperRow.find(params[:id])
    @dish = Dish.find(@paper_row.dish_id)
  end

  def new
    @paper_row = PaperRow.new
    @orders = Order.select(:id).map { |d| [d.id] }
    @dishes = Dish.select(:id, :name).map { |d| [d.name, d.id] }
  end

  def create
    @paper_row = PaperRow.new(paper_row_params)
  
    if @paper_row.save
      redirect_to @paper_row
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def paper_row_params
      params.require(:paper_row).permit(:quantity, :order_id, :dish_id)
    end
end
