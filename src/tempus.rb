require 'logger'
require 'yaml'

$config = nil

parsed = begin
  $config = YAML.load(File.open("src/config.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

p $config

#$log = Logger.new(STDOUT)
#
#require_relative "./solver/solver.rb"
#require_relative "./solver/rule.rb"
#require_relative "./parser/parser.rb"
#
#
#class Tempus 
#include Solver, Parser
#
#end
