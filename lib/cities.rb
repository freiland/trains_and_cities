class City
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all()
    returned_cities = DB.exec('SELECT * FROM cities;')
    cities=[]
    returned_cities.each() do |city|
      name = city.fetch("name")
      id = city.fetch("id").to_i
      cities.push(City.new({:name => name, :id => id}))
    end
    cities
  end 

  def ==(other_city)
    self.name() == other_city.name()
  end 

  def save
    result = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM cities *;")
  end

  def self.find(id)
    city = DB.exec("SELECT * FROM cities WHERE id = #{id};").first()
    name = city.fetch('name')
    id = city.fetch('id').to_i
    City.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  def delete
    DB.exec("DELETE FROM cities where id = #{@id};")
  end

end