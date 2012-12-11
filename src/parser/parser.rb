module Parser
  
  def parse(data)
    clean_data = clean_data(data)
    @resources = parse_resources(clean_data)
    @time_slots = parse_time_slots(clean_data)
    @rules = parseRules(clean_data)
    @resources.all?{|e| e.is_a?(Symbol)} && @time_slots.all?{|e| e.is_a?(Symbol)} && @rules.all?{|e| e.is_a?(Rule)}
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
  
  def parse_resources(data)
    parse_symbols_between_delimiters("resources", "time_slots",data)
  end
  
  def parse_time_slots(data)
    parse_symbols_between_delimiters("time_slots", "rules",data)
  end
  
  def parseRules(data)
    rule_strings = (Regexp.new "(rules) (.*)").match(data)[2].split(",")
    raise "no rule found" if rule_strings.length <= 0
    rule_strings.map {|rule_string| Rule.new(rule_string) }
  end

end
