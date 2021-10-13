class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    artist ? artist.name : nil
  end 

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
        note = Note.create(content: content)
        notes << note
      end 
    end
  end 

  def note_contents
    notes.collect do |note|
      note.content
    end 
  end 
end
