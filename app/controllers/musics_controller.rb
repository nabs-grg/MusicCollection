class MusicsController < ApplicationController
	def index
	end

	def new
		@music = Music.new
	end

	def create
		@music = Music.new(music_params)
	end

	private 
		#when a user fills in the inforamtion and sends a request, its going to be passed with the information the user filled out in a form.
		#define the params and the params to able to sue
		def book_params
			params.require(:music).permit(:album, :track, :artist, :genre, :released)
		end

end
