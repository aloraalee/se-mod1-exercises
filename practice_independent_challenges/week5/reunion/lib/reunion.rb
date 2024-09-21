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

  def total_owed_per_participant
    final_owed = {}

    @activities.each do |activity|

      activity.owed.each do |participant, amount|
        if !final_owed.has_key?(participant)
          final_owed[participant] = amount
        else
          final_owed[participant] += amount
        end
      end
    end
    final_owed
  end
  
  def print_summary
    total_owed_per_participant.each do |participant, amount|
      if amount > 0
        puts "#{participant}: owes $#{'%.2f' % amount}"
      elsif amount < 0 
        puts "#{participant}: is owed $#{'%.2f' % amount.abs}"
      else
        puts "#{name}: is all settled up"
      end
    end
  end
end