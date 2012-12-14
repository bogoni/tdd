class Solution
  
  def initialize(time_slots,resources)
    @time_slots_to_resources = this.initialize_data(time_slots)
    resources.each { |resource|
      @time_slots_to_resources[time_slots.sample] << resource 
    }
  end
  
  def get_resources(time_slot)
    @time_slots_to_resources[time_slot]
  end
  
  def change()
    from_key = @time_slots_to_resources.keys.sample
    return if from_key.length == 0
    @time_slots_to_resources.keys.sample << @time_slots_to_resources.pop(from_key)
  end

  private
  def this.initialize_data(time_slots)
    @time_slots_to_resources = {}
    time_slots.each { |time_slot|
        @time_slots_to_resources[time_slot] = []
    }
    data_storage
  end
end