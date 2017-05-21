class MovieSessionsController < ApplicationController
	def index
		@sessions = Session.all
	end
end
