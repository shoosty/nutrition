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

#completed
class FoodGroup  < ActiveRecord::Base
  # works with table food_groups
  has_many :food_descriptions, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd
end

#completed
class FoodDescription  < ActiveRecord::Base
  has_one :food_group, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd

  def to_s
    self.Long_Desc
  end

  def inspect
    #without the self it thinks it is a constant becuase it starts with upper case. to compensate the self. is added to specifically tell ruby it is a method and not a constant.
    self.Long_Desc
  end
end

class Footnote < ActiveRecord::Base
end

class Langdesc < ActiveRecord::Base
end

class LangDesc < ActiveRecord::Base
end

class Langual < ActiveRecord::Base
end

#completed
class NutData < ActiveRecord::Base
end

#completed
class NutrDef < ActiveRecord::Base
end

class SrcCd < ActiveRecord::Base
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
