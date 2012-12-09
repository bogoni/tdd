require 'logger'

$log = Logger.new(STDOUT)

require_relative "./solver/solver.rb"
require_relative "./solver/rule.rb"
require_relative "./parser/parser.rb"


class Tempus 
include Solver, Parser

end
