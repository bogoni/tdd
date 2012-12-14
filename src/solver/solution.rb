class Solution
  
  def initialize(time_slots,resources)
    @time_slots_to_resources = this.initialize_data(time_slots)
    resources.each { |resource|
      @time_slots_to_resources[time_slots.sample] << resource 
    }
  end
  
  def get_resources(time_slot)
    data_storage[time_slot]
  end
  
  private
  def this.initialize_data(time_slots)
    data_storage = {}
    time_slots.each { |time_slot|
        data_storage[data_storage] = []
    }
    data_storage
  end
end