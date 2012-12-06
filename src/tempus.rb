require 'logger'

$log = Logger.new(STDOUT)

require_relative "./rule.rb"
require_relative "./tree_node.rb"

class Tempus 

  def parse(data)
    clean_data = clean_data(data)
    @resources = parseResources(clean_data)
    @processes = parseProcesses(clean_data) 
    @rules = parseRules(clean_data)
    @resources.all?{|e| e.is_a?(Symbol)} && @processes.all?{|e| e.is_a?(Symbol)} && @rules.all?{|e| e.is_a?(Rule)}
  end

  def solve
    
    
    root = Tree_node.new("root")   
    root.add_node( a = Tree_node.new("a"))
    a.add_node( b = Tree_node.new("b"))
    a.add_node( c = Tree_node.new("c"))
    c.add_node( d = Tree_node.new("d"))
    root.add_node(e = Tree_node.new("e"))
    e.add_node(f = Tree_node.new("f"))
    e.add_node(g = Tree_node.new("g"))
    
    root.each_depth_first do |child|
      puts child.name
    end
  end
  
  private
  
  def clean_data(data)
    data.gsub(/[\n\r\t]/," ").gsub(/\s+/," ")
  end
  
  def parse_symbols_between_delimiters(delimiter1, delimiter2, data)
    $log.info("*** parse_symbols_between_delimiters(#{delimiter1} #{delimiter2}) ***")
    regexp = (Regexp.new "(#{delimiter1}) (.*) (#{delimiter2})")
    match_data = regexp.match(data)
    raise "data not found" unless match_data.size == 4
    string_array = match_data[2].split(",")
    $log.debug(string_array)
    raise "no element found between delimiters #{delimiter1} and #{delimiter2}" if string_array.length <= 0
    string_array.map {|resource_string| resource_string.to_sym }
  end
  
  def parseResources(data)
    parse_symbols_between_delimiters("resources", "processes",data)
  end
  
  def parseProcesses(data)
    parse_symbols_between_delimiters("processes", "rules",data)
  end
  
  def parseRules(data)
    rule_strings = (Regexp.new "(rules) (.*)").match(data)[2].split(",")
    raise "no rule found" if rule_strings.length <= 0
    rule_strings.map {|rule_string| Rule.new(rule_string) }
  end


     
    


end
