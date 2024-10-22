class DishesController < ApplicationController
  
  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
    @recipe_ingredients = Recipe.find_by_sql("SELECT ingredients.name, recipes.quantity FROM recipes, ingredients WHERE recipes.ingredient_id = ingredients.id AND recipes.dish_id = ?", @dish.id)
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
