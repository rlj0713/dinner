
class Dinner::CLI
    def call
        # Prints Welcome Screen
        puts "\n\nWhat would you like to eat for dinner?\n "
        puts "              / )                     "
        puts "        |||| / /                      "
        puts "        ||||/ /                       "
        puts "        \\__(_/      1 - Chicken      "
        puts "         ||//       2 - Pork          "
        puts "         ||/        3 - Beef          "
        puts "         ||         4 - Vegetables    "
        puts "        (||         5 - Seafood       "
        puts "         \"\"                     \n\n"

        # Asks user for a protein selection
        puts "Please enter a number (1 - 5)."
        user_protein_selection = gets.chomp
        line_break

        # Prints a List of Meals based on the protein chosen
        puts ""
        meal_options = Dinner::API.get_meal_list(user_protein_selection)
        i = 1
        meal_options.each do |meal|
            puts "     #{i}.  #{meal['strMeal']}"
            i += 1
        end
        line_break

        # Asks user for a meal selection
        puts "Please enter a number (1 - 15)."
        user_meal_selection = gets.chomp

        # Prints the details for the meal selected
        meal = Dinner::API.create_meal(user_meal_selection)
        line_break

        puts "Your have chosen #{meal.meal_name}, excellent choice.\n "
        puts "Recipe Nationality: #{meal.nationality}"
        puts "Video Instructions: #{meal.video}"

        puts " \nShopping List:"
        meal.shopping_list.each do |item|
            puts "     \u2022  #{item}"
        end

        puts " \nProcedure:"
        puts meal.procedure
    end
    
    def line_break
        puts "\n ------------------------------------------\n "
    end

    def error_message
        puts "Incorrect input, please try again.\n "
    end

end