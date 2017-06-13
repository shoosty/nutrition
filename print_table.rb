
require_relative 'config/database.rb'

fd     = FoodDescription.first
data   = fd.nut_data
values = data.map(&:nutr_def)
result = data.map { |data| {value: data.Nutr_Val, description: data.nutr_def.NutrDesc, unit: data.nutr_def.Units} }

puts "Nutrition data for: #{fd.Shrt_Desc}"
puts
tp result
