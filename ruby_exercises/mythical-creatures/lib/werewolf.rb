class Werewolf
  attr_reader :name, :location, :monstor_blood, :hunger

    def initialize(name, location='London')
      @name = name
      @location = location
      @monster_blood = 0
      @hunger = 0
      @victim = nil
    end

    def change!
      @monster_blood += 1
      @hunger += 1
    end

    def human?
      @monster_blood.even?
    end

    def wolf?
      @monster_blood.odd?
    end

    def hungry?
      @hunger.odd? 
    end

    def consume_victim
      if wolf?
        @hunger = 0
        @victim = Victim.new
        @victim.status = "dead"
        "You ate a victim."
      else
        "Your victim was safe this time."
      end
    end

    def check_victim_status
      @victim.status
    end
end

class Victim
  attr_accessor :status

  def initialize
    @status = :alive
  end
end