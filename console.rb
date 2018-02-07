require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({ 'name' => 'Led Zeppelin'})
artist2 = Artist.new({ 'name' => 'Radiohead'})
artist3 = Artist.new({ 'name' => 'Rage against the machine'})
artist4 = Artist.new({ 'name' => 'Metallica'})
artist5 = Artist.new({ 'name' => 'Creedence Clearwater Revival'})

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()


album1 = Album.new({
  'title' => 'Houses of the Holy',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album2 = Album.new({
  'title' => 'Led Zeppelin IV',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album3 = Album.new({
  'title' => 'Led Zeppelin',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album4 = Album.new({
  'title' => 'Physical Graffiti',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })
album5 = Album.new({
  'title' => 'Rage against the machine',
  'genre' => 'Rock',
  'artist_id' => artist3.id
  })

  album1.save()
  album2.save()
  album3.save()
  album4.save()
  album5.save()



  binding.pry


  nil
