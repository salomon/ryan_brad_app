class StaticPagesController < ApplicationController
  protect_from_forgery with: :exception

	def about
		render "about"
	end

	def home
		render "home"
	end

end
