require 'spec_helper'

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@activity).to be_an_instance_of(Activity)
      expect(@activity.name).to eq("Brunch")
    end
  end

    it 'can have participants, but it starts out as an empty array' do
      expect(@activity.participants).to eq({})
    end

    it 'can add participants' do
      @activity.add_participant("Maria", 20)

      expect(@activity.participants).to eq({"Maria" => 20})
    end

    it 'can report total cost' do
      @activity.add_participant("Maria", 20)

      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
    end

    it 'can split the cost evenly' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.split).to eq(30)
    end

    it 'can return costs owed by name' do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end


end