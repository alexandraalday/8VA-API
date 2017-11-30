class AddTrackToArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :artists, :track, foreign_key: true
  end
end
