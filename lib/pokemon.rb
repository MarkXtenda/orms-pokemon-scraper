class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(name)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) VALUES
        (?,?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        pok_arr = db.execute(sql, id)[0]
        pokemon = Pokemon.new(pok_arr[1])
        pokemon.id = pok_arr[0]
        pokemon.type = pok_arr[2]
        pokemon
    end
end
