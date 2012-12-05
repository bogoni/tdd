class Tempus
 
  def parse(data)
    @resources = this.getResources(data)
    @processes = this.getProcesses(data) 
    @rules = this.getRules(data)
    [@resources, @processes, @rules].all?{|i| i.is_a?(Array) && i.length > 0}
  end

  def solve
  end

end
