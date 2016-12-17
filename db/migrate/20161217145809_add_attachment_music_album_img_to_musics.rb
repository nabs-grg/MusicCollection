class AddAttachmentMusicAlbumImgToMusics < ActiveRecord::Migration
  def self.up
    change_table :musics do |t|
      t.attachment :music_album_img
    end
  end

  def self.down
    remove_attachment :musics, :music_album_img
  end
end
