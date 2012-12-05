require "../src/tempus.rb"
require "test/unit"
 
class TestTempus < Test::Unit::TestCase
 
  def test_parse_method_exists
    assert(Tempus.new.respond_to?('parse'),"parse does not exist");
  end
  def test_solve_method_exists
    assert(Tempus.new.respond_to?('solve'),"solve does not exist");
  end

end