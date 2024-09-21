require 'spec_helper'

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
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

end