require 'sinatra'
require 'json'
require_relative '../solver/process.rb'

enable :static

get '/' do
  if  ENV['RACK_ENV'] == 'test' then
    File.new('src/server/public/index.htm').readlines
  else
    redirect '/index.htm'
  end  
end

get '/getProcAsJson' do
  processes = []
  process = Process_.new
  processes << process
  processes.to_json 
end

get '/helloWorld' do
  "Hello World #{params[:name]}".strip
end