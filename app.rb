require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Declares a route that responds to a request with:
  #  - a GET method
  #  - the path /hello?name=Leo
  get '/hello' do
    name = params[:name]
    return "Hello #{name}"
  end

  # Declares a route that responds to a request with:
  #  - a POST method
  #  - the path /submit
  # With body parameters:
  # name=Leo
  # message=Hello world
  
  post '/submit' do
    name = params[:name]
    message = params[:message]
    return "Thanks #{name}, you sent this message: '#{message}'"
  end
end