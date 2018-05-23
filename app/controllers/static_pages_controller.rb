class StaticPagesController < ActionController::Base
  protect_from_forgery with: :exception

	def about
		render "about"
	end

	def home
		render "home"
	end

end
