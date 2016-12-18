class Review < ApplicationRecord
	belongs_to :music
	belongs_to :user
end
