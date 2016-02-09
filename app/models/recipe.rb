class Recipe < ActiveRecord::Base
	has_many :batches
	has_many :ingredients, dependent: :destroy
end
