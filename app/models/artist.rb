class Artist < ApplicationRecord
	validates :name, presence:true
	validates :email, presence:true
	validates :status, presence:true
	attr_accessor :track_data
	has_many :tracks, :dependent => :destroy
	has_many :genres, :through => :tracks

	def save_attachments(params) 
		params[:track_data].each do |track| 
			self.tracks.create(:mp3 => track) 
		end 
	end
end
