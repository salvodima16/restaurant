class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @dishes = Dish.select(:id, :name).map { |d| [d.name, d.id] }
    @ingredients = Ingredient.select(:id, :name).map { |d| [d.name, d.id] }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :dish_id, :ingredient_id, :quantity)
    end
end