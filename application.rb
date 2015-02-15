require "sinatra"
require "bundler"
require 'sinatra/json'

Bundler.require
configure do
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| 
    require File.basename(lib, '.*') 
  }
end
require "error"

DataMapper.setup(:default, 'sqlite::mmemory:')
DataMapper.finalize
DataMapper.auto_migrate!

get "/Error" do
  "This URL is used for Error Handling"
end

get    '/ErrorHandler' do
  content_type :json

 error = Error.all
 error.to_json
end

get    '/ErrorHandler/:id' do
#  content_type :json
#
#  errors = Error.get params[:id]
#  errors.to_json

   Errors = Error.get(params[:id])
   erb :error
    
end

post   '/ErrorHandler' do
  content_type :json

  error = Error.new params[:error]
  if error.save
    status 201
  else
    status 500
    json review.errors.full_messages
  end
end

put    '/ErrorHandler/:id' do
  content_type :json

  error = Error.get params[:id]
  if error.update params[:error]
    status 200
    json "Error was updated"
  else
   status 500
   json error.errors.full_messages
  end
end
  
delete '/ErrorHandler/:id' do
  content_type :json

  error = Error.get params[:id]
  if error.destroy
    status 200
    json "Error was removed."
  else
    status 500
    json "There is a problem removing the Error."
  end
end
