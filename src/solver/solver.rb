module Solver
  def solve(processes,resources)
    result = []
    resources.permutation(processes.length) { |e| 
      result << e if true #TODO: substitute "true" for rules
    }
    result
  end
end