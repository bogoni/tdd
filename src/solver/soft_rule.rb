require_relative "./hard_rule.rb"

class SoftRule < HardRule

  def initialize(scenario, goal, credit)
    super(scenario, goal)
    @credit = credit
  end

  def how_much_credit?(solution)
    return 0 unless valid_scenario?(solution)
    how_much_goal_achieved?(solution) * @credit 
  end

  def how_much_goal_achieved?(solution)
    raise "not implemented yet -- will return a factor [0..1] to be multiplied by the rule credit"
  end
  
  def satisfied?(solution)
    return false unless valid_scenario?(solution)
    goal_achieved?(solution)
  end

  def goal_achieved?(solution)
    raise "SoftRule::goal_achieved? not implemented yet (must reach all credit)"
  end

  
end
