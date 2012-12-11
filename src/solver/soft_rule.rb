require_relative "./hard_rule.rb"

class SoftRule < HardRule

  def initialize(scenario, goal, credit)
    super(scenario, goal)
    @credit = credit
  end
  
end
