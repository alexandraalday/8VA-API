class Track < ApplicationRecord
	belongs_to :artist
	belongs_to :genre
	has_attached_file :mp3,
					  :url => '/:class/:id/:style.:extension',
					  :path => ':rails_root/public/:class/:id_partition/:style.:extension'

	validates_attachment :mp3, content_type: { 
		content_type: [
  			'application/mp3',
			'application/x-mp3',
			'audio/mpeg',
			['audio/mpeg'], 
			'audio/mp3'
		] 
	}
end
