class HomeController < ApplicationController
	def index

	end
	def query
		if input_valid?(params[:query])
			Query.query_email(params[:query]).deliver
			@message = "Thank you for querying."
			render 'index'
		else
			@message = "Something went wrong. Did you fill all fields?"
			render 'index'
		end
 	end

 	private
 	def input_valid?(input)
 		!(input[:full_name].length < 1 || input[:email].length < 1 || input[:price].length < 1 || input[:message].length < 1)
 	end
end
