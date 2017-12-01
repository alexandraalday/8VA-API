class AddAttachmentMp3ToTracks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :tracks do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :tracks, :mp3
  end
end
