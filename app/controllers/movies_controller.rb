class MoviesController < ApplicationController
	
	def show
		puts "ROLA ***************"
		@movie = Movie.find(params[:id])
	end

	def index
		@movies = Movie.all
	end


end
