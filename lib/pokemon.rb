class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL
    
    db.execute(sql, [name, type])
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(pokemon[1], pokemon[2], db, id)
  end
end
