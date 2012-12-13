require 'sinatra'
require 'json'
require_relative '../solver/time_slot.rb'

enable :static

get '/' do
  if  ENV['RACK_ENV'] == 'test' then
    File.new('src/webserver/public/index.htm').readlines
  else
    redirect '/index.htm'
  end  
end

get '/getTimeSlotAsJson' do
  '{"resources":{"resourceObjectArray":[{"resourceName":"firstResource"},{"resourceName":"secondResource"},{"resourceName":"thirdResource"}]},"processes":{"processObjectArray":[{"processName":"firstProcess"},{"processName":"secondProcess"},{"processName":"thirdProcess"}]}}'
  #[TimeSlot.new, TimeSlot.new, TimeSlot.new].to_json
end

get '/helloWorld' do
  "Hello World #{params[:name]}".strip
end

post '/postjson' do
  "I got #{params[:textfieldForTesting]}."
end

get '/testPosting' do
  redirect '/testposting.htm'
end