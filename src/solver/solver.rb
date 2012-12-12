module Solver

  def solve(time_slots,resources, hard_rules, soft_rules)
    solution_to_test = this.solution_candidate(time_slots,resources)
    until hard_rules.all?{|hard_rule| hard_rules.applies? solution_to_test} do
      $log.info("Trying to satisfy all hard rules")
    end
    raise "Solver#solve soft rules test not implemented yet. missing loop with yaml defined satistaction cut"
  end
  
  def solution_candidate(time_slots,resources)
    Solution.new(time_slots,resources)
  end

end