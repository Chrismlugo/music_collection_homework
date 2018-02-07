require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({ 'name' => 'Led Zeppelin'})
artist2 = Artist.new({ 'name' => 'Radiohead'})

artist1.save()
artist2.save()


album1 = Album.new({
  'title' => 'Houses of the Holy',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

  album1.save()



  binding.pry


  nil
