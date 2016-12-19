class MusicsController < ApplicationController
	#before any of these action initicaited we are going to find our music and we only want to find the music for the following actions
	before_action :find_music, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		#check if the params is filled with one of the genre or not and show the music collection according to the selected genre
		if params[:genre].blank?
			@musics = Music.all.order("created_at DESC")
		else
			#finding the name that is passed into the params and getting the information of the genre_id passed in the Genre
			@genre_id = Genre.find_by(name: params[:genre]).id
			@musics = Music.where(:genre_id => @genre_id).order("created_at DESC")
		end
	end
	#to show the music we need  to first find the music
	#not to repeat our self DRY code since we will be using show action  to find the music and then when we add or edit or update and destroy functionality (we will also be finding music there to)
	def show
		#we still have find music to show the music
		if @music.reviews.blank?
			@average_review = 0
		else
			@average_review = @music.reviews.average(:rating).round(2)
		end
	end

	#update the new and create action and since its only creating a standalone music without any association
	def new
		#@music = Music.new
		#now its creating the music from the current user by the build method
		@music = current_user.musics.build
		#access genre when creating new Music
		@genre = Genre.all.map{ |g| [g.name, g.id] }
	end

	def create
		#@music = Music.new(music_params)
		@music = current_user.musics.build(music_params)
		#the category of the music genre is associated with newly created music
		@music.genre_id = params[:genre_id]

		if @music.save
      		redirect_to root_path
   		else
      		render 'new'
    	end
	end
    #display edit view with the form to edit with what the user already has so when the form is submiited again the user will be chaning the value of book params
    def edit
    	#mapping the genre so that when the form is in edit mode then ahve access to all the genre
    	@genre = Genre.all.map{ |g| [g.name, g.id]}
    end

    def update
    	@music.genre_id = params[:genre_id]
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
		#define the params and the params to able to use
		def music_params
			params.require(:music).permit(:album, :track, :artist, :released_year, :genre_id, :music_album_img)
		end

		#refactor and define a metho called find music
		def find_music
			#when we click on the first music the params id will be 1 and second music album the params id will be 2/ corresponding to unique music album that is passed via params
			@music = Music.find(params[:id])
		end


