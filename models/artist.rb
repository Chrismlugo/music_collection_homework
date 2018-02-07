require ('pg')
require_relative('../db/sql_runner')
class Artist

attr_reader :name, :id



  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    db = PG.connect(dbname: 'music_collection', host: 'localhost')
    sql = 'INSERT INTO artists (name) Values ($1) RETURNING *;
  '
  values = [@name]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end


end
