module Solver
  def initialize(time_slots,resources, hard_rules, soft_rules)
    initial_solution_candidate = Solution.new(time_slots,resources) until hard_rules.all?{|hard_rule| hard_rules.satisfied? solution_candidate}
    @evolver = Evolver.new(initial_solution_candidate)
  end
  def solve
    @evolver.run
    @evolver.get_current_solution
  end
  
end