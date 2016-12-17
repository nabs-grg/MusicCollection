class Music < ApplicationRecord
	belongs_to :user
	belongs_to :genre

	has_attached_file :music_album_img, styles: { music_index: "250x350>", music_show: "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :music_album_img, content_type: /\Aimage\/.*\z/
end
