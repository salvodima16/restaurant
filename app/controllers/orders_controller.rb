class OrdersController < ApplicationController
  
  def show
    @table = Table.find(params[:table_id])
    @order = @table.orders.find(params[:id])
    @dishes = Dish.joins(:orders).where("order_id = ?", params[:id]).select("dishes.name, paper_rows.quantity")
  end

  def new
    Order.new
  end

  def create
    @table = Table.find(params[:table_id])
    @order = @table.orders.create(order_params)
    redirect_to order_path(@table)
  end

  private
    def order_params
      params.require(:order).permit(:number, :name, :people)
    end
  
end
