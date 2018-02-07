require ('pg')
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
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id)
    VALUES
    ($1,$2,$3) RETURNING *;"
    values = [@title,@genre,@artist_id]
    db.prepare('save', sql)
    @id = db.exec_prepared('save', values)[0]['id'].to_i
    db.close()
  end
end
