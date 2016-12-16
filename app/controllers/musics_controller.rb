class MusicsController < ApplicationController
	#before any of these action initicaited we are going to find our music and we only want to find the music for the following actions
	before_action :find_music, only: [:show, :edit, :update, :destroy]

	def index
		@musics = Music.all.order("created_at DESC")
	end
	#to show the music we need  to first find the music
	#not to repeat our self DRY code since we will be using show action  to find the music and then when we add or edit or update and destroy functionality (we will also be finding music there to)
	def show
		#we still have find music to show the music
	end

	def new
		@music = Music.new
	end

	def create
		@music = Music.new(music_params)
		if @music.save
      redirect_to root_path
    else
      render 'new'
    end
	end
    #display edit view with the form to edit with what the user already has so when the form is submiited again the user will be chaning the value of book params
    def edit

    end

    def update
    	#check if book is updated successfully and changing the value of the music params and pass in the music-params so that the music is updating with the new inforamtion
    	if @music.update(music_params)
    		#with respect to @music instance variable we have
    		redirect_to music_path(@music)
    	else
    		#otherwise render new form called edit
    		render 'edit'
    	end
    end

    def destroy
    	@music.destroy
    	redirect_to root_path
    end

end

	private 
		#when a user fills in the inforamtion and sends a request, its going to be passed with the information the user filled out in a form.
		#define the params and the params to able to sue
		def music_params
			params.require(:music).permit(:album, :track, :artist, :genre, :released_year)
		end

		#refactor and define a metho called find music
		def find_music
			#when we click on the first music the params id will be 1 and second music album the params id will be 2/ corresponding to unique music album that is passed via params
			@music = Music.find(params[:id])
		end


