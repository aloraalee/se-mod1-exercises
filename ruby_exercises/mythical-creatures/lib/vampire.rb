class Vampire
    attr_reader :name,
                :pet,
                :thirsty

    def initialize(name, pet="bat") #If you create a 
        # new instance of the vampire and you only give it one argument 
        #it will have an argument of a name and it will default to bat. 
        @name = name
        @pet = pet
        @thirsty = true
    end
    
    def pet 
        @pet
    end

    def drink
        @thirsty = false
    end

    
end
