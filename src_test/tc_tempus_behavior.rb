require "src/tempus.rb"
require "test/unit"
 
class Test_tempus < Test::Unit::TestCase
  
  def setup
    @input_test_structure =  %Q( 
      resources
      resource_1 ,resource_2
      processes
      process_1, process_2, process_3, process_4
      rules
      dontcare -> max_usage(resource_2, 2),
      usage(process_1, resource_1) -> usage(process_2, resource_2) : 1
    )
    @tempus = Tempus.new
  end

  def test_parse_input
    p "*** test_parse_input_structure *** "
    assert(@tempus.parse(@input_test_structure), "parse error")
    p "*** test_parse_input_structure Done! *** "    
  end

  def test_solve_tree
    p "*** test_solve_tree *** "
    @tempus.solve
    #assert(@tempus.parse(@input_test_structure), "parse error")
    p "*** test_solve_tree Done! *** "    
  end

end