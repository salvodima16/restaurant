class OrdersController < ApplicationController
  
  def show
    @table = Table.find(params[:table_id])
    @orders = @table.order.all
  end

  def new
    Order.new
  end

  def create
    @table = Table.find(params[:table_id])
    @order = @table.order.create(order_params)
    redirect_to order_path(@table)
  end

  private
    def order_params
      params.require(:order).permit(:number, :name, :people)
    end
  
end
