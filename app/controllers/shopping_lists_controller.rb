class ShoppingListsController < ApplicationController
  def index
    @user = current_user
    @foods = Food.all
    @recipes = Recipe.where(user_id: @user.id) # or @recipes =@user.recipes

    @recipe_foods = RecipeFood.where(recipe_id: @recipes.ids) # or @recipe_foods = @recipes.map(&:recipe_foods).flatten
    @shopping_list = []
    @recipe_foods.each do |recipe_food|
      @shopping_list << recipe_food
    end
    @final_list = @foods.where(id: @shopping_list.map(&:food_id))

    @price = @final_list.pluck(:price)
    @quantity = @final_list.pluck(:quantity)
    @total = @price.zip(@quantity).map { |x, y| x.to_i * y.to_i }.sum
  end
end
