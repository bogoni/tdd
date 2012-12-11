require 'sinatra'
require 'json'
require_relative '../solver/time_slot.rb'

enable :static

get '/' do
  if  ENV['RACK_ENV'] == 'test' then
    File.new('src/server/public/index.htm').readlines
  else
    redirect '/index.htm'
  end  
end

get '/getTimeSlotAsJson' do
  [TimeSlot.new].to_json
end

get '/helloWorld' do
  "Hello World #{params[:name]}".strip
end