# For Sinatra routing. Run with ```ruby app.rb```
require('sinatra')
require('sinatra/reloader')
require('./lib/trains')
require('./lib/cities')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "amtrak"})

get ('/') do
  erb :homepage
end

get ('/trains') do 
  @trains = Train.all
  erb :trains
end

get ('/cities') do 
  @cities = City.all
  erb :cities
end

post ('/cities') do 
  name = params[:city_name]
  city = City.new(:name => name, :id => nil)
  city.save()
  redirect to ('/cities')
end

get('/cities/:id') do
  @city = City.find(params[:id].to_i)
  erb :city
end

patch ('/cities/:id') do
  @city = City.find(params[:id].to_i)
  @city.update(params[:name])
  redirect to ('/cities')
end 

delete ('/cities/:id') do 
  @city = City.find(params[:id].to_i)
  @city.delete
  redirect to('/cities')
end

post ('/trains') do 
  name = params[:train_name]
  train = Train.new(:name => name,:id => nil )
  train.save()
  redirect to('/trains')
end

get('/trains/:id') do
  @train = Train.find(params[:id].to_i)
  erb :train
end

patch ('/trains/:id') do
  @train = Train.find(params[:id].to_i)
  @train.update(params[:name])
  redirect to ('/trains')
end 

delete ('/trains/:id') do 
  @train = Train.find(params[:id].to_i)
  @train.delete
  redirect to('/trains')
end
