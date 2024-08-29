class Direwolf
    attr_reader :name, :home, :size, :starks_to_protect, :protects

    def initialize(name, home="Beyond the Wall", size="Massive")
        @name = name
        @home = home
        @size = size
        @starks_to_protect = []
    end
    

    def protects(stark)
        if stark.location == @home && @starks_to_protect.length < 2
          @starks_to_protect << stark
          stark.protected = true
        end
      end

    def hunts_white_walkers?
        if @starks_to_protect.empty?
            true
        else
            false
        end
    end

    def leaves(stark)
        @starks_to_protect.clear
        stark.protected = false
        stark
    end


end


class Stark
    attr_reader :name, :location, :safe
    attr_accessor :protected

    def initialize(name, location="Winterfell")
        @name = name 
        @location = location
        @protected = false
    end

    def safe?
        @protected
    end

    def house_words
        "Winter is Coming"
    end
end