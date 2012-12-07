def processes(procs_to_parse)
  procs = []
  procs.each {| identifier, properties | procs << Process.new(identifier, properties) }
  procs
end

def right(text)
  puts "Just read a correct answer: #{text}"
end

def wrong(text)
  puts "Just read an incorrect answer: #{text}"
end