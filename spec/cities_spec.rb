require 'spec_helper'
require 'rspec'
require 'cities'
require 'trains'
require 'pry'

describe '#City' do
  
  describe('.all') do
    it("returns an empty array when there are no cities") do
      expect(City.all).to(eq([]))
    end
  end

  describe('#==') do
    it("identify it as the same city if it has the same attributes") do
      city1 = City.new({:name => "Starlight Express", :id => nil})
      city2 = City.new({:name => "Starlight Express", :id => nil})
      expect(city1).to(eq(city2))
    end
  end

  describe ('#save') do 
    it ('saves a city to the city table') do 
      city = City.new({:name => "NorthWest Express", :id => nil})
      city.save()
      city1 = City.new({:name => "Starlight Express", :id => nil})
      city1.save()
      expect(City.all).to(eq([city, city1]))
    end
  end

  describe('.clear') do
    it("clears everything from citys") do
      city1 = City.new({:name => "Empire Builder", :id => nil})
      city1.save
      city2 = City.new({:name => "Thomas Tank Engine", :id => nil})
      city2.save
      City.clear
      expect(City.all).to(eq([]))
    end
  end

  describe('.find') do 
    it ('will find a city by id and create a new city object') do 
      city1 = City.new({:name => "Empire Builder", :id => nil})
      city1.save
      city2 = City.new({:name => "Thomas Tank Engine", :id => nil})
      city2.save
      expect(City.find(city1.id)).to(eq(city1))
    end
  end

  describe('#update') do
    it("changes the name by matching the id") do
      city1 = City.new({:name => "Empire Builder", :id => nil})
      city1.save
      city1.update("Empire Destroyer")
      expect(city1.name).to(eq("Empire Destroyer"))
    end
  end

  describe('#delete') do
  it("deletes a city entry by matching id") do 
    city1 = City.new({:name => "Empire Builder", :id => nil})
    city1.save
    city2 = City.new({:name => "Thomas Tank Engine", :id => nil})
    city2.save
    city1.delete
    expect(City.all).to(eq([city2]))
  end 
end 


end