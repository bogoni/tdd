class Tempus
 

  def parse(data)
    @resources = this.parseResources(data)
    @processes = this.parseProcesses(data) 
    @rules = this.parseRules(data)
    [@resources, @processes, @rules].all?{|i| i.is_a?(Array) && i.length > 0}
  end

  def solve
  end
  
  private
  
  def parseResources(data)
    throw :not_implemented_yet
  end
  def parseProcesses(data)
    throw :not_implemented_yet
  end
  def parseRules(data)
    throw :not_implemented_yet
  end

      
     
    


end
