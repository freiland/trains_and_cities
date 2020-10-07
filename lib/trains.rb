class Train
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all()
    returned_trains = DB.exec('SELECT * FROM trains;')
    trains=[]
    returned_trains.each() do |train|
      name = train.fetch("name")
      id = train.fetch("id").to_i
      trains.push(Train.new({:name => name, :id => id}))
    end
    trains
  end 

  def ==(other_train)
    self.name() == other_train.name()
  end 

  def save
    result = DB.exec("INSERT INTO trains (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM trains *;")
  end

  def self.find(id)
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};").first()
    name = train.fetch('name')
    id = train.fetch('id').to_i
    Train.new({:name => name, :id => id})
  end

  def update(name)
    @name = name
    DB.exec("UPDATE trains SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  def delete
    DB.exec("DELETE FROM trains where id = #{@id};")
  end

end