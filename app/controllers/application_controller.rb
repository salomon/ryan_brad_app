class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

	def home
	end

	def about
	end

end


