
  class CommonImport

    DATA_FOLDER = "USDA_Nutrition/sr28asc/"
    TABLES = {
      "DATA_SRC.txt" => DataSrc,
      "DATSRCLN.txt" => Datsrcln,
      "DERIV_CD.txt" => Deriv_Cd,
      "FD_GROUP.txt" => FoodGroup,
      "FOOD_DES.txt" => FoodDescription,
      "FOOTNOTE.txt" => Footnote,
      "LANGDESC.txt" => Language_description,
      "LANGUAL.txt"  => Langual,
      "NUT_DATA.txt" => NutDatum,
      "NUTR_DEF.txt" => NutrDef,
      "SRC_CD.txt"   => Source_Code,  # check this one
      "WEIGHT.txt"   => Weight
    }

    def initialize(file_name:)
      @file_name = file_name
      @table = TABLES.fetch(file_name) { raise 'table not found...' }
    end

    def import_all!
      puts "Started Import"
      counter = 0

      file_to_import.force_encoding("ISO-8859-1").split("\r\n").each{|raw_data| import_into_database(import(raw_data))

      puts counter += 1
      }
    end

    def file_to_import
      #binding.pry
      File.read(DATA_FOLDER + @file_name)
    end

    def import(raw_data)   #single line' of text from a file
      raw_data.split('^').map{|x| x.gsub('~', '')}
    end

    def table_column_names
      @table.columns.map{|x| x.name.to_sym}[1..-1]
    end

private
    def import_into_database(single_line)
      @table.create(table_column_names.zip(single_line).to_h)
    end
  end

  # Dir[settings.root + "/USDA_Nutrition/sr28asc/*.txt"].each {|file| file.split("/")[-1]}
  # end

def run_import_all!
  # list of commands to load files.
  CommonImport.new(file_name: "DATA_SRC.txt").import_all!
  # this file is very large be patient when running.
  CommonImport.new(file_name: "DATSRCLN.txt").import_all!
  CommonImport.new(file_name: "DERIV_CD.txt").import_all!
  CommonImport.new(file_name: "FD_GROUP.txt").import_all!
  CommonImport.new(file_name: "FOOD_DES.txt").import_all!
  CommonImport.new(file_name: "FOOTNOTE.txt").import_all!
  CommonImport.new(file_name: "LANGDESC.txt").import_all!
  CommonImport.new(file_name: "LANGUAL.txt").import_all!
  CommonImport.new(file_name: "NUT_DATA.txt").import_all!
  CommonImport.new(file_name: "NUTR_DEF.txt").import_all!
  CommonImport.new(file_name: "SRC_CD.txt").import_all!
  CommonImport.new(file_name: "WEIGHT.txt").import_all!
end

# class FoodDesImport < CommonRecordFormat
#   # def food_des
#   #   File.read('USDA_Nutrition/sr28asc/FOOD_DES.txt')
#   # end
#
#   def import_into_database(single_line)
#     tags = FoodDescription.columns.map{|x| x.name.to_sym}[1..14]
#     FoodDescription.create(tags.zip(single_line).to_h)
#   end
#
#   def import_food_descriptions
#     import_all(file_to_import("FOOD_DES.txt"))
#     # FoodDesImport.new.import_food_descriptions
#   end
# end
#
# class FoodGroupsImport < CommonRecordFormat
#
#   def import_into_database(single_line)
#     tags = FoodGroup.columns.map{|x| x.name.to_sym}[1..2]
#     FoodGroup.create(tags.zip(single_line).to_h)
#   end
#
#   def import_fd_groups
#     import_all(file_to_import("FD_GROUP.txt"))
#     # FoodGroupsImport.new.import_fd_groups
#   end
# end
#
# class NutrDefsImport < CommonRecordFormat
#
#   def import_into_database(single_line)
#     tags = NutrDef.columns.map{|x| x.name.to_sym}[1..7]
#     NutrDef.create(tags.zip(single_line).to_h)
#   end
#
#   def import_nutr_def
#     puts ".......... Working .........."
#     import_all(file_to_import("NUTR_DEF.txt"))
#     # will tirgger even if failed. puts ".......... Success .........."
#     # NutrDefsImport.new.import_nutr_def
#   end
# end

# def source_files
# Dir[settings.root + "/USDA_Nutrition/sr28asc/*.txt"].each {|file| file.split("/")[-1]}
# end
