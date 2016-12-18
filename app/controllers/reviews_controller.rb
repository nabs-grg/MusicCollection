class ReviewsController < ApplicationController

	before_action :find_music

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.music_id = @music.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to music_path(@music)
		else
			render 'new'
		end
	end

	private 

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_music
			@music = Music.find(params[:music_id])
		end

end
