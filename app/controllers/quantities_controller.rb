class QuantitiesController < ApplicationController
  def index
    @quantity = Quantity.all
  end

  def show
    @quantity = Quantity.find(params[:id])
    @dish = Dish.find(@quantity.dish_id)
    @ingredient = Ingredient.find(@quantity.ingredient_id)
  end

  def new
    @quantity = Quantity.new
    @dishes = Dish.select(:id, :name).map { |d| [d.name, d.id] }
    @ingredients = Ingredient.select(:id, :name).map { |d| [d.name, d.id] }
  end

  def create
    @quantity = Quantity.new(quantity_params)
    
    if @quantity.save
      redirect_to @quantity
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def quantity_params
      params.require(:quantity).permit(:dish_id, :ingredient_id, :quantity)
    end
end
