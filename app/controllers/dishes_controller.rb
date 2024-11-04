class DishesController < ApplicationController
  
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @ingredients = Ingredient.joins(:quantities).where("dish_id = ?", params[:id]).select("ingredients.name, quantities.quantity")
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    
    if @dish.save
      redirect_to @dish
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def dish_params
      params.require(:dish).permit(:name, :price)
    end

end
