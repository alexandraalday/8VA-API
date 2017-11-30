class AddGenreToTracks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tracks, :genre, foreign_key: true
  end
end
