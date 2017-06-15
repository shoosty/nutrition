require_relative 'config/database.rb'

Choice = Struct.new(:choice_number, :descriptions)

def provide_choices_to_user
  count_of_choices = 15
  food_selection   = FoodDescription.first(count_of_choices)

  puts " "
  puts "Please choose the number associated with the food you are interested in learning about."
  puts "\n\n"
  tp food_selection.zip(1..count_of_choices).map{|a, b| Choice.new(b, a) }
  response = gets.chomp.downcase
  exit if response == "exit"

  (1..count_of_choices).zip(food_selection)[response.to_i - 1][1]
end

def choice
  fd          = FoodDescription.where("Shrt_Desc = '#{provide_choices_to_user}'")
  data        = fd.map{|data| data.nut_data}.flatten
  values      = data.map(&:nutr_def)
  result      = data.map { |data| {description: data.nutr_def.NutrDesc, value: data.Nutr_Val, unit: data.nutr_def.Units} }
  column_name = fd.map{|column_name| column_name.Shrt_Desc}

  puts "Nutrition data for: #{column_name}"
  tp result.first(10)

  choice
end

choice
