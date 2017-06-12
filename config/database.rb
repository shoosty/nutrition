# Dir.pwd
require 'active_record'
require 'minitest/autorun'
require 'table_print'

ActiveRecord::Base.establish_connection(
adapter: "sqlite3",
database: "db/database.db"
)

class DataSrc < ActiveRecord::Base
end

class Datsrcln < ActiveRecord::Base
end

class Deriv_Cd < ActiveRecord::Base
end

class FoodGroup  < ActiveRecord::Base
  # works with table food_groups
  has_many :food_descriptions, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd
end

class FoodDescription  < ActiveRecord::Base
  has_one :food_group, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd
  has_many :nut_data, foreign_key: :NDB_No, primary_key: :NDB_No

# both of these methods change the representation of hte object only when printing. Optional.
  def to_s   # puts
    self.Shrt_Desc
  end

  def inspect   # when you use p it uses inspect
    #without the self it thinks it is a constant becuase it starts with upper case. To compensate the self is added to specifically tell ruby it is a method and not a constant.
    self.Long_Desc
  end
end
# the symbol after the has_one example :food_group is the method.
#........................................
class NutDatum < ActiveRecord::Base
  has_one :food_description, foreign_key: :NDB_No, primary_key: :NDB_No
  has_one :nutr_def, foreign_key: :Nutr_No, primary_key: :Nutr_No
end

class NutData < ActiveRecord::Base
  has_one :food_description, foreign_key: :NDB_No, primary_key: :NDB_No
  has_one :nutr_def, foreign_key: :Nutr_No, primary_key: :Nutr_No
end
#......................................
class NutrDef < ActiveRecord::Base
  has_many :nut_data, foreign_key: :Nutr_No, primary_key: :Nutr_No
end

class Footnote < ActiveRecord::Base
end

class Language_description < ActiveRecord::Base
end

class Langual < ActiveRecord::Base
end

class Source_Code < ActiveRecord::Base
end

class Weight < ActiveRecord::Base
end

fd = FoodDescription.new
fg = FoodGroup.new

def test
  # test examples using related tables
  FoodDescription.first.food_group
  FoodDescription.last.food_group
  FoodGroup.first.food_description   # this only works with has_one
  tp FoodGroup.first.food_descriptions  # notice the plaural realted to has_many.
  tp FoodGroup.all[1].food_descriptions
  tp FoodDescription.where "Long_Desc like '%Bacon%'"
  puts FoodDescription.select("Long_Desc").where("Long_Desc like '%Bacon%'").last
end
