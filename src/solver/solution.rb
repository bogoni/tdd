class Solution
  
  def initialize(time_slots,resources)
    @time_slots_to_resources = {}
    time_slots.each { |time_slot|
      @time_slots_to_resources[time_slot] = []
      resources.each { |resource|
        @time_slots_to_resources[time_slot] << resource if rand(2) == 0
      }
    }
  end
end