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

    expect(@reunion.reunion_total_cost). to eq(90)
  end

end