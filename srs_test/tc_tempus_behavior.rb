require "../srs/tempus.rb"
require "test/unit"
 
class Test_tempus < Test::Unit::TestCase
  
  def setup
    @input_test_structure =  %Q( 
      [resources]
      [processes]
      [rules]
    )
    @tempus = Tempus.new
  end

  def test_parse_input_structure
    @tempus.parse(@input_test_structure)
    assert(@tempus.parse,"test_parse not implemented");
  end

  def test_parse
    assert(@tempus.parse,"test_parse not implemented");
  end

  def test_solve
    assert(@tempus.solve,"test_solve not implemented");
  end

end