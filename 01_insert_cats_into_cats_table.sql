class Song
  attr_accessor :name, album
  attr_reader :id
  
  def initialize(id = nil, name, album)
    @id = id
    @name = name
    @album = album
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end
  
  def save
    if self.id
      self.update
    else
    sql = <<-SQL
      INSERT INTO songs (name, album)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
    end
  end
  
  def self.create(name:, album:)
  song = Song.new(name, album)
  song.save
  song
  end
  
  def self.find_by_name(name)
    sql = SELECT * FROM songs WHERE name = ?
    result = DB[:conn].execute(sql, name)[0]
    Song.new(result[0], result[1], result[2])
  end
  
  def update
    sql = <<-SQL
      UPDATE songs SET name = ?, album = ? WHERE id = ?
    SQL
    DB[:conn].execute(sql, self.name, self.album, self.id)
  end
  
  def self.find_or_create_by(name:, album:)
  song = DB[[:conn].execute("SELECT * FROM songs WHERE name = ? AND album = ?", name, album)
  if !song.empty?
    song_data = song[0]
    song = Song.new(song_data[0], song_data[1], song_data[2])
    else
    song = self.create(name: name, album: album)
  end
  end
  
end

class Application
 
  @@items = ["Apples","Carrots","Pears"]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
 
      search_term = req.params["q"]
 
      if @@items.include?(search_term)
        resp.write "#{search_term} is one of our items"
      else
        resp.write "Couldn't find #{search_term}"
      end
 
    else
      resp.write "Path Not Found"
    end
 
    resp.finish
  end
  
  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
  
  if resp.path=="/songs"
  resp.write "we found songs"
  else
    resp.write "path not found"
    resp.status = 404
  end
  resp.finish
  end
end