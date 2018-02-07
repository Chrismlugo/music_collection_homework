require ('pg')
require_relative('../db/sql_runner')
class Album

attr_accessor :title, :genre, :artist_id
attr_reader :id


  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id)
    VALUES
    ($1,$2,$3) RETURNING *;"
    values = [@title,@genre,@artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|albums| Album.new(albums)}

  end

  def artist()
    sql = 'SELECT * FROM artists WHERE id = $1 '
    values = [@artist_id]
    artist_details = SqlRunner.run(sql, values)
    result = Artist.new(artist_details.first)
  end

  def update()
    sql = 'UPDATE albums SET (genre, title) = ($1,$2) WHERE id = $3'
    values = [@genre, @title, @id]
     SqlRunner.run(sql,values)

  end


end
