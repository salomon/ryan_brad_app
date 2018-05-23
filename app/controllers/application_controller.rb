class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def home
		render html: "hello, world test"
	end

	def about
		render "about"
	end

end


