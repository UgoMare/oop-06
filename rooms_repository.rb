class RoomsRepository
  def initialize
    @rooms = []
    @next_id = 1
  end

  def create_room(room)
    @rooms << room
    room.id = @next_id
    @next_id += 1
  end

  def find(id)
    #CODE THE WAY TO FIND THE ROOM INSTANCE WITH THE ID `ID`
  end

end
