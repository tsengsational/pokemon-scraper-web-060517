require 'pry'

class Pokemon
  attr_reader :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp:nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = 60
  end

  def self.save(name, type, db, hp = nil)
    query = "INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')"
    # binding.pry
    db.execute(query)
  end

  def self.find(id, db)
    query = "SELECT * FROM pokemon WHERE id = '#{id}'"
    pokemon_arr = db.execute(query).first
    pokemon = self.new(name: pokemon_arr[1], type: pokemon_arr[2], db: db, id: pokemon_arr[0], hp: pokemon_arr[3])
    pokemon
  end

end
