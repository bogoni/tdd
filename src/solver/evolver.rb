require_relative "./solution.rb"

def Evolver
  def initialize(initial_solution)
    @current_solution = initial_solution.clone
  end
  def get_current_solution
    @current_solution.clone
  end
end