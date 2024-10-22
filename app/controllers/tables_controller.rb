class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(ingredient_params)
    
    if @table.save
      redirect_to @table
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])

    if @table.update(ingredient_params)
      redirect_to @table
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def ingredient_params
      params.require(:table).permit(:number)
    end
end
