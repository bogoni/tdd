require_relative "../src/webserver/tempus_webserver.rb"
require "test/unit"
require "rack/test"

set :environment, :test
ENV['RACK_ENV'] = 'test'

class Tempus_Webserver_Tester < Test::Unit::TestCase

  def test_it_says_hello_world
    p "*** test_it_says_hello_world ***"
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/helloWorld'
    assert browser.last_response.ok?
    assert_equal 'Hello World', browser.last_response.body
    p "*** test_it_says_hello_world done!***"    
  end

  def test_it_says_hello_to_a_person
    p "*** test_it_says_hello_to_a_person ***"
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/helloWorld', :name => 'Simon'        
    assert browser.last_response.body.include?('Simon')
    p "*** test_it_says_hello_to_a_person done***"    
  end
  
  def test_get_time_slots_as_json
    p "*** test_get_time_slots_as_json ***"
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/getTimeSlotAsJson'
    assert browser.last_response.body.include?('TimeSlot')
    p "*** test_get_time_slots_as_json done!***"
  end
  
  def test_open_public_folder
    p "*** test_open_public_folder ***"
    browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    browser.get '/'
    assert browser.last_response.body.include?('index.htm')
    p "*** test_it_says_hello_world done!***"    
  end

end