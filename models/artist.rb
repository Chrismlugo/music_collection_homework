require ('pg')
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
  db.prepare('save', sql)
  @id = db.exec_prepared('save', values)[0]['id'].to_i
  db.close()
  end


end
