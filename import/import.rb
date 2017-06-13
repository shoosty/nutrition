
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
      "SRC_CD.txt"   => Source_Code,
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
      File.read(DATA_FOLDER + @file_name)
    end

    def import(raw_data)
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

def run_import_all!
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
