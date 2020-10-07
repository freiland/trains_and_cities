require 'spec_helper'
require 'rspec'
require 'cities'
require 'trains'
require 'pry'

describe '#Train' do
  
  describe('.all') do
    it("returns an empty array when there are no trains") do
      expect(Train.all).to(eq([]))
    end
  end

  describe('#==') do
    it("identify it as the same train if it has the same attributes") do
      train1 = Train.new({:name => "Starlight Express", :id => nil})
      train2 = Train.new({:name => "Starlight Express", :id => nil})
      expect(train1).to(eq(train2))
    end
  end

  describe ('#save') do 
    it ('saves a train to the train table') do 
      train = Train.new({:name => "NorthWest Express", :id => nil})
      train.save()
      train1 = Train.new({:name => "Starlight Express", :id => nil})
      train1.save()
      expect(Train.all).to(eq([train, train1]))
    end
  end
end