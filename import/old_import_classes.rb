# database methods work with active record. Active record is actived in the

# class ImportFoodDesc
#
#   def food_desc
#     File.read('USDA_Nutrition/sr28asc/FOOD_DES.txt')
#   end
#
#   def import(raw_data)
#     raw_data.split('^').map{|x| x.gsub('~', '')}
#   end
#
#   def import_all
#     food_desc.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))}
#   end
#
#   def import_into_database(single_line)
#     # new enumerable 'zip' it acts like a zipper creating an array converted into a hash.
#     # FoodDescription.columns.each{|x|x.name }
#     tags = FoodDescription.columns.map{|x| x.name.to_sym}[1..14]
#     FoodDescription.create(tags.zip(single_line).to_h)
#   end
# end

# class ImportFoodGroups
#
#   def food_group
#     File.read('USDA_Nutrition/sr28asc/FD_GROUP.txt')
#   end
#
#   def import(raw_data)
#     raw_data.split('^').map{|x| x.gsub('~', '')}
#   end
#
#   def import_all
#     food_group.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| p import_into_database(import(raw_data))}
#   end
#
#   def import_into_database(single_line)
#     tags = FoodGroup.columns.map{|x| x.name.to_sym}[1..2]
#     FoodGroup.create(tags.zip(single_line).to_h)
#   end
# end


# class ImportNutrDefs
#
#   def nutr_def
#     File.read('USDA_Nutrition/sr28asc/NUTR_DEF.txt')
#   end
#
#   def import(raw_data)
#     raw_data.split('^').map{|x| x.gsub('~', '')}
#   end
#
#   def import_all
#     nuter_def.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))}
#   end
#
#   def import_into_database(single_line)
#     tags = NutrDef.columns.map{|x| x.name.to_sym}[1..7]
#     NutrDef.create(tags.zip(single_line).to_h)
#   end
# end



class ImportNutData

  def nut_data
    File.read('USDA_Nutrition/sr28asc/NUT_DATA.txt')
  end

  def import(raw_data)
    raw_data.split('^').map{|x| x.gsub('~', '')}
  end

  def import_all
    nut_data.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))}
  end

  def import_into_database(single_line)
    tags = NutData.columns.map{|x| x.name.to_sym}[1..7]
    NutData.create(tags.zip(single_line).to_h)
  end
end
