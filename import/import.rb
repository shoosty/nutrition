class CommonRecordFormat
  def import(raw_data)
    raw_data.split('^').map{|x| x.gsub('~', '')}
  end

  def import_all(file_to_import)
    file_to_import.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))}
  end

  def file_to_import(file_to_import)
    File.read('USDA_Nutrition/sr28asc/'+ file_to_import)
  end

  def source_files
  Dir[settings.root + "/USDA_Nutrition/sr28asc/*.txt"].each {|file| file.split("/")[-1]}
  end

end

class FoodDesImport < CommonRecordFormat
  # def food_des
  #   File.read('USDA_Nutrition/sr28asc/FOOD_DES.txt')
  # end

  def import_into_database(single_line)
    tags = FoodDescription.columns.map{|x| x.name.to_sym}[1..14]
    FoodDescription.create(tags.zip(single_line).to_h)
  end

  def import_food_descriptions
    import_all(file_to_import("FOOD_DES.txt"))
    # FoodDesImport.new.import_food_descriptions
  end
end





class FoodDesImport < CommonRecordFormat
  # def food_des
  #   File.read('USDA_Nutrition/sr28asc/FOOD_DES.txt')
  # end

  def import_into_database(single_line)
    tags = FoodDescription.columns.map{|x| x.name.to_sym}[1..14]
    FoodDescription.create(tags.zip(single_line).to_h)
  end

  def import_food_descriptions
    import_all(file_to_import("FOOD_DES.txt"))
    # FoodDesImport.new.import_food_descriptions
  end
end

class FoodGroupsImport < CommonRecordFormat

  def import_into_database(single_line)
    tags = FoodGroup.columns.map{|x| x.name.to_sym}[1..2]
    FoodGroup.create(tags.zip(single_line).to_h)
  end

  def import_fd_groups
    import_all(file_to_import("FD_GROUP.txt"))
    # FoodGroupsImport.new.import_fd_groups
  end
end

class NutrDefsImport < CommonRecordFormat

  def import_into_database(single_line)
    tags = NutrDef.columns.map{|x| x.name.to_sym}[1..7]
    NutrDef.create(tags.zip(single_line).to_h)
  end

  def import_nutr_def
    puts ".......... Working .........."
    import_all(file_to_import("NUTR_DEF.txt"))
    # will tirgger even if failed. puts ".......... Success .........."
    # NutrDefsImport.new.import_nutr_def
  end
end
