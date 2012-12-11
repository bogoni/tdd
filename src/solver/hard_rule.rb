class HardRule

  def initialize(scenario, goal)
    @scenario, @goal = scenario, goal
  end
  
  def applies?(solution)
    return false unless valid_scenario?(solution)
    return goal_achieved?(solution)
  end
  
  
  protected
  def valid_scenario?(solution)
    raise "HardRule::valid_scenario? not implemented yet"
  end
  
  def goal_achieved?(solution)
    raise "HardRule::goal_achieved? not implemented yet"
  end
end
