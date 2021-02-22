
class Dinner::API

    # Hard-coded the protein choices to keep the number of options simple
    @protein_options = ["Chicken", "Pork", "Beef", "Vegetarian", "Seafood"]


    # Gets an array of 15 Recipe objects from the API based on user_protein_selection
    def self.get_recipe_list(user_protein_selection)
        protein_choice = @protein_options[user_protein_selection.to_i - 1]
        meals_by_protein = []
        recipes_by_protein = HTTParty.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=#{protein_choice}").values[0].take(15)
    end
    
    #Gets the recipe details from the API based on user_meal_selection
    def self.get_recipe_detail



    end
end