class CommonRecordFormat
  def import(raw_data)
    raw_data.split('^').map{|x| x.gsub('~', '')}
  end

  def import_all(file_to_import)
    file_to_import.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))}
  end
end

class FoodDesImport < CommonRecordFormat
  def food_des
    File.read('USDA_Nutrition/sr28asc/FOOD_DES.txt')
  end

  def import_into_database(single_line)
    tags = FoodDescription.columns.map{|x| x.name.to_sym}[1..14]

    FoodDescription.create(tags.zip(single_line).to_h)
  end

  def import_food_descriptions
    # import = FoodDesImport.new
    # import.import_all(food_des)

    import_all(food_des)
    #return "Success"
    # command to execute import
    # FoodDesImport.new.import_food_descriptions
  end
end

class FoodGroupsImport < CommonRecordFormat

  def food_groups
    File.read('USDA_Nutrition/sr28asc/FD_GROUP.txt')
  end

  def import_into_database(single_line)
    tags = FoodGroup.columns.map{|x| x.name.to_sym}[1..2]
    FoodGroup.create(tags.zip(single_line).to_h)
  end

  def import_food_groups
    # import = FoodGroupsImport.new
    # import.import_all(food_groups)
    import_all(food_groups)
    # return "Success"

    # command to execute import
    # FoodGroupsImport.new.import_food_groups
  end
end

class NutrDefsImport < CommonRecordFormat

  def nutr_def
    File.read('USDA_Nutrition/sr28asc/NUTR_DEF.txt')
  end

  def import_into_database(single_line)
    tags = NutrDef.columns.map{|x| x.name.to_sym}[1..7]
    NutrDef.create(tags.zip(single_line).to_h)
  end

  def import_nutr_def
    # import = NutrDefsImport.new
    #nutr_def = import.nutr_def
    puts "Working"
    # import.import_all(nutr_def)
    import_all(nutr_def)
    # return "Success"
    # FoodGroupsImport.new
    # command to execute import
    # NutrDefsImport.new.import_nutr_def
  end
end
