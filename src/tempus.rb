require 'logger'
require 'yaml'

$config = nil

parsed = begin
  $config = YAML.load(File.open("src/config.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

$log = Logger.new(STDOUT)

