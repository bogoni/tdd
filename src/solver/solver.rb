module Solver
  def initialize(time_slots,resources, hard_rules, soft_rules)
    @hard_rules, @soft_rules = hard_rules, soft_rules
    #TODO: THIS COULD LEAD TO AN INFINIT LOOP IF THE SET OF HARD RULES ARE NOT SATISFIABLE (FIX)
    @current_solution = Solution.new(time_slots,resources) until this.all_hard_rules_satisfied?
   @current
  end
  def solve_step
    this.run
    this.get_current_solution
  end
  
  def get_current_solution
    Marshal.load( Marshal.dump(@current_solution) )
  end
  
  private
  def run
    (1..$config[solver][default_number_of_soft_rules_iterations]).each {|i|
        this.evolve_step
      }
  end
  
  def evolve_step
    next_solution_candidate = this.get_current_solution.change
    @current_solution = next_solution_candidate if this.solution_credit(@current_solution) < this.solution_credit(next_solution_candidate)   
  end

  def all_hard_rules_satisfied?
    @hard_rules.all?{|hard_rule| hard_rules.satisfied? @current_solution}
  end  
  
  def solution_credit(solution_to_evaluate)
    @soft_rules.map{|soft_rule| soft_rule.credit(@solution_to_evaluate)}.reduce(:+)
  end  

end