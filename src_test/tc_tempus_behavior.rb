require "test/unit"
require_relative "../src/tempus.rb"
 
class Test_tempus < Test::Unit::TestCase
  
  def setup
    @input_test_structure =  %Q( 
      resources
      resource_1 ,resource_2
      time_slots
      time_slot_1, time_slot_2, time_slot_3, time_slot_4
      rules
      dontcare -> max_usage(resource_2, 2),
      usage(time_slot_1, resource_1) -> usage(time_slot_2, resource_2) : 1
    )
    @tempus = Tempus.new
  end

  def test_parse_input
    p "*** test_parse_input_structure *** "
    assert(@tempus.parse(@input_test_structure), "parse error")
    p "*** test_parse_input_structure Done! *** "    
  end

  def test_solve
    p "*** test_solve *** "
    #@tempus.solve
    assert(false, "solve yet to be implemented")
    p "*** test_solve Done! *** "    
  end
  
end