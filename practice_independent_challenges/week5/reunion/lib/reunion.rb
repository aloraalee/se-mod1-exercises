require_relative './activity'

class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end


  def reunion_cost_hash
    reunion_cost_hash = {}

    @activities.each do |activity|
      reunion_cost_hash[activity.name] = activity.total_cost
    end

    reunion_cost_hash
  end

  def reunion_total_cost
    reunion_cost_hash.values.sum
  end

  
end