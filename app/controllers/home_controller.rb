class HomeController < ApplicationController
	def index

	end
	def query
		if input_valid?(params[:query])
			Query.query_email(params[:query]).deliver
			@message = "Thank you for querying."
		else
			@message = "Something went wrong. Did you fill all fields?"
		end
		render 'index'
 	end
	def error
		Query.error(request.headers).deliver
		render 'index'
	end
 	private
 	def input_valid?(input)
 		!(input[:full_name].length < 1 || input[:email].length < 1 || input[:price].length < 1 || input[:message].length < 1)
 	end
end
