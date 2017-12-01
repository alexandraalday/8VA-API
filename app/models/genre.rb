class Genre < ApplicationRecord
	has_many :artists, :through => :tracks
end
