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

  describe('.clear') do
    it("clears everything from trains") do
      train1 = Train.new({:name => "Empire Builder", :id => nil})
      train1.save
      train2 = Train.new({:name => "Thomas Tank Engine", :id => nil})
      train2.save
      Train.clear
      expect(Train.all).to(eq([]))
    end
  end

  describe('.find') do 
    it ('will find a train by id and create a new train object') do 
      train1 = Train.new({:name => "Empire Builder", :id => nil})
      train1.save
      train2 = Train.new({:name => "Thomas Tank Engine", :id => nil})
      train2.save
      expect(Train.find(train1.id)).to(eq(train1))
    end
  end

  describe('#update') do
    it("changes the name by matching the id") do
      train1 = Train.new({:name => "Empire Builder", :id => nil})
      train1.save
      train1.update("Empire Destroyer")
      expect(train1.name).to(eq("Empire Destroyer"))
    end
  end
end