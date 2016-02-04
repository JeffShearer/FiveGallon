class Recipe < ActiveRecord::Base
	has_many :batches
end
