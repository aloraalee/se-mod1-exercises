class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, paid)
    @participants[name] = paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.size
  end

  def owed
    owed_hash = {}
    even_split = split

    @participants.each do |name, paid|
        owed_hash[name] = even_split - paid
    end
    owed_hash
  end

end