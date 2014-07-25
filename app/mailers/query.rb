class Query < ActionMailer::Base
  default from: "happenly_query@asish.com"

 
  def query_email(input)
  	@input = input
   	mail(to: 'getaasciesh@hotmail.com', subject: 'New happenly.com query has arrived.')
  end
  def error(input)
    @input = input
   	mail(to: 'getaasciesh@hotmail.com', subject: 'New error from happenly.com has arrived.')
  end
end
