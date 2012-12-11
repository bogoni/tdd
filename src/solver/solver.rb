module Solver
  def solve(time_slots,resources)
    result = []
    resources.permutation(time_slots.length) { |e| 
      result << e if true #TODO: substitute "true" for rules
    }
    result
  end
end