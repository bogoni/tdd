def time_slots(procs_to_parse)
  procs = []
  procs.each {| identifier, properties | procs << TimeSlot.new(identifier, properties) }
  procs
end
