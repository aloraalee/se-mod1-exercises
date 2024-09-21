class Ogre
  attr_reader :name, :home
  attr_accessor :swings

  def initialize(name, home='Swamp')
    @name = name
    @home = home
    @swings = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    if human.notices_ogre? 
      swing_at(human)
    end
  end

  def swing_at(human)
    @swings += 1
    if @swings.even?
      human.health = 0
    end
  end

  def apologize(human)
    human.health = 50
  end
end





class Human
  attr_reader :name
  attr_accessor :encounter_counter, :health

  def initialize(name="Jane")
    @name = name
    @encounter_counter = 0
    @health = 100
  end

  def notices_ogre?
    @encounter_counter % 3 == 0 && @encounter_counter != 0
  end

  def knocked_out?
    health == 0
  end
end