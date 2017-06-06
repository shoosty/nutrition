# def import_food_groups
#   import = ImportFoodGroups.new
#   food_groups = import.food_group
#   import.import_all
# end

# def import_food_descriptions
#   import = ImportFoodDesc.new
#   food_desc = ImportFoodDesc.new.food_desc
#   import.import_all
# end


def import_food_descriptions
  import = FoodDesImport.new
  #food_desc = FoodDesImport.new.food_desc
  import.import_all
end

# def import_nut_data
#   import = ImportNutData.new
#   nut_data = import.nut_data
#   import.import_all
# end

def import_nuter_defs
  import = ImportNutrDefs.new
  nuter_def = import.nuter_def
  import.import_all
end
