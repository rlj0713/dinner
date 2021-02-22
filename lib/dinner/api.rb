
class Dinner::API

    # Hard-coded the protein choices to keep the number of options simple
    @protein_options = ["Chicken", "Pork", "Beef", "Vegetarian", "Seafood"]


    # Gets an array of 15 Recipe objects from the API based on user_protein_selection
    def self.get_meal_list(user_protein_selection)
        protein_choice = @protein_options[user_protein_selection.to_i - 1]
        @meals_by_protein = HTTParty.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=#{protein_choice}").values[0].take(15)
    end
    
    # Instantiates a new recipe object with a name & id
    def self.create_meal(user_meal_selection)
        meal_index = user_meal_selection.to_i - 1
        @meal_detail = @meals_by_protein[meal_index]
        @meal = Dinner::Meal.new(@meal_detail["idMeal"], @meal_detail["strMeal"])
        @meal.summary = HTTParty.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{@meal_detail["idMeal"]}").values[0][0]
        @meal
    end
        
end