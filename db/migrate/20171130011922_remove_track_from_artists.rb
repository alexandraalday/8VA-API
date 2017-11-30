class RemoveTrackFromArtists < ActiveRecord::Migration[5.1]
  def change
    remove_reference :artists, :track, foreign_key: true
  end
end
