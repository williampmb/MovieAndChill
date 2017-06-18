class MovieSessionsController < ApplicationController
	def index
		@sessions = Session.all.paginate(page: params[:page], per_page: 6)
	end
end
