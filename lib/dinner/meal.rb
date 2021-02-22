
class Dinner::Meal
    attr_reader :meal_id, :meal_name, :procedure, :shopping_list, :nationality, :video
    attr_accessor :summary

    def initialize(meal_id, meal_name)
        @meal_id = meal_id
        @meal_name = meal_name
        @procedure = nil
        @shopping_list = []
        @nationality = nil
        @video = nil
        @summary = {}
    end

    # Returns a meal procedure string
    def procedure
        @procedure = @summary["strInstructions"]
    end

    # Returns a shopping list array
    def shopping_list
        ingredient_list = []
        @summary.each do |key, value|
            if key.include?("strIngredient") && value != ""
                ingredient_list << value
            end
        end

        measurement_list = []
        @summary.each do |key, value|
            if key.include?("strMeasure") && value != " "
                measurement_list << value
            end
        end

        measurement_list.zip(ingredient_list).each do |measurement, ingredient|
            if ingredient != nil && ingredient.empty? == false
                if measurement != " "
                    @shopping_list << "#{ingredient}: #{measurement}"
                else
                    @shopping_list << "#{ingredient}"
                end
            end
        end
        @shopping_list
    end

    def nationality
        @nationality = @summary["strArea"]
    end

    def video
        @video = @summary["strYoutube"]
    end

    # Gets all meal details based on selection
    # def self.summary
    #     @summary = HTTParty.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{@meal_id}").values[0][0]
    # end
end