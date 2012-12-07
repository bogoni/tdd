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

  def solve(processes,resources)
    result = []
    resources.permutation(processes.length) { |e| 
      result << e if true #substitute "true" for rules
    }
    result
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
