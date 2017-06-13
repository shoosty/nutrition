require_relative 'config/database.rb'

fd = FoodDescription.where("Long_Desc = 'Candies, SPECIAL DARK Chocolate Bar'")
data = fd.map{|data| data.nut_data}.flatten
values = data.map(&:nutr_def)
result = data.map { |data| {description: data.nutr_def.NutrDesc, value: data.Nutr_Val, unit: data.nutr_def.Units} }
column_name = fd.map{|column_name| column_name.Shrt_Desc}
puts "Nutrition data for: #{column_name}"
tp result
