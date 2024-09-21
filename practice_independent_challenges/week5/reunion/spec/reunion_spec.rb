require 'spec_helper'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@reunion).to be_an_instance_of(Reunion)
      expect(@reunion.name).to eq("1406 BE")
    end
  end

  it 'has activites' do
    expect(@reunion.activities).to eq([])
  end

  it 'can add activites to the activites array' do
    @reunion.add_activity(@activity_1)

    expect(@reunion.activities).to eq([@activity_1])
  end

  it 'can return the total cost of the reunion' do
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)

    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)

    expect(@activity_1.total_cost).to eq(60)

    @activity_2.add_participant("Maria", 20)
    @activity_2.add_participant("Luther", 10)

    expect(@activity_2.total_cost).to eq(30)

    expect(@reunion.reunion_cost_hash).to eq({"Brunch"=>60, "Drinks"=>30})

    expect(@reunion.reunion_total_cost). to eq(90)
  end

  it 'can return a hash with the participants name as a key and 
    what they owe for the whole reunion as a value' do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
  
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Maria", 20)
      @activity_2.add_participant("Luther", 10)
  
      expect(@reunion.total_owed_per_participant).to eq({"Maria" => 5, "Luther" => -5})
    end

    it 'can print a summary of each participants name and what they owe,
      separated by a line break' do

        @reunion.add_activity(@activity_1)
        @reunion.add_activity(@activity_2)
    
        @activity_1.add_participant("Maria", 20)
        @activity_1.add_participant("Luther", 40)
        @activity_2.add_participant("Maria", 20)
        @activity_2.add_participant("Luther", 10)

        expected_output = [
          "Maria: owes $5.00",
          "Luther: is owed $5.00"
        ]

        output = capture_stdout { @reunion.print_summary }

        actual_lines = output.split("\n").map(&:strip)

        expect(actual_lines).to eq(expected_output)
      end

end