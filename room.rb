require 'pry-byebug'
require_relative 'patient'

class RoomCapacityError < Exception
end

class Room
  #STATES?
  attr_reader :patients
  def initialize(args = {})
    @capacity = args[:capacity] || 2
    @patients = args[:patients] || [] # Array of Patient instances
  end

  #BEHAVIOR?
  def add_patient(patient)
    if full?
      fail RoomCapacityError, 'The room is full'
    else
      @patients << patient
      patient.room = self
    end
  end

  def full?
    @capacity == @patients.length
  end

end

room1 = Room.new(capacity: 2)

joe = Patient.new(name: 'Joe')
room1.add_patient(joe)

p joe.room

# bob = Patient.new(cured: true, name: 'Bob')
# room1.add_patient(bob)

# p room1.patients.first # Array of Patient instances
