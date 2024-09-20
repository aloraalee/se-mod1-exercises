class Wizard
    attr_reader :name,
                :bearded,
                :tiredness
    def initialize(name, bearded: true)
        @name = name 
        @bearded = bearded
        @tiredness = 0
    end

    def bearded?
        @bearded
    end

    def rested?
        true
    end

    def cast 
        @tiredness +=1
        "MAGIC MISSILE!"
    end

    def rested?
        if tiredness >= 3
            false
        else
            true
        end
    end


end