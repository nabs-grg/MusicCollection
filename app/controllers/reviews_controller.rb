class ReviewsController < ApplicationController

	before_action :find_music
	before_action :find_review, only: [:edit, :update, :destroy]

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

	def edit
	end

	def update

		if @review.update(review_params)
			redirect_to music_path(@music)
		else
			render 'new'
		end
	end

	def destroy
		@review.destroy
		redirect_to music_path(@music)
	end


	private 

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_music
			@music = Music.find(params[:music_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end
