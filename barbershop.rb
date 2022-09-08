require 'sinatra'

get '/' do
	erb :index
end

post '/' do
	@user_name = params[:user_name]
	@phone     = params[:phone]
	@date_time = params[:date_time]

	@title = 'Thank you!'
	@message = "Dear #{@user_name} we'll be waiting for you at #{@date_time}"

	notebook = File.open 'notebook.txt', 'a'
	notebook.write "User: #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time}"
	notebook.close

	erb :message
end