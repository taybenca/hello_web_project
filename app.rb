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
    return erb(:index)
  end

  get '/names' do
    name1 = params[:name1]
    name2 = params[:name2]
    name3 = params[:name3]
    return "#{name1}, #{name2}, #{name3}"
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

  post '/sort-names' do
    names = params[:names]
    names_arr = names.split(",").sort
    return names_arr.join(",")
  end
end