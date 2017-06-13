
require 'active_record'
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

class FoodGroup < ActiveRecord::Base
  has_many :food_descriptions, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd
end

class FoodDescription < ActiveRecord::Base
  has_one :food_group, foreign_key: :FdGrp_Cd, primary_key: :FdGrp_Cd
  has_many :nut_data, foreign_key: :NDB_No, primary_key: :NDB_No

  def to_s
    self.Shrt_Desc
  end

  def inspect
    self.Long_Desc
  end
end

class NutDatum < ActiveRecord::Base
  has_one :food_description, foreign_key: :NDB_No, primary_key: :NDB_No
  has_one :nutr_def, foreign_key: :Nutr_No, primary_key: :Nutr_No
end

class NutData < ActiveRecord::Base
  has_one :food_description, foreign_key: :NDB_No, primary_key: :NDB_No
  has_one :nutr_def, foreign_key: :Nutr_No, primary_key: :Nutr_No
end

class NutrDef < ActiveRecord::Base
  has_many :nut_data, foreign_key: :Nutr_No, primary_key: :Nutr_No
end

class Footnote < ActiveRecord::Base
end

class Language_Description < ActiveRecord::Base
end

class Langual < ActiveRecord::Base
end

class Source_Code < ActiveRecord::Base
end

class Weight < ActiveRecord::Base
end
