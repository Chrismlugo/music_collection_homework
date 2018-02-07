require ('pg')
require_relative('../db/sql_runner')
class Artist

attr_accessor :name

attr_reader :id



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

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    artist_albums = SqlRunner.run(sql, values)
    return artist_albums.map{|artist| Album.new(artist)}
  end

  def update()
    sql = 'UPDATE artists SET name = $1 WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM artists WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def Artist.delete_all()
    sql = 'DELETE FROM artists;'
    SqlRunner.run(sql)
  end

  def Artist.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql, values)
    return artist[0]
  end


end
