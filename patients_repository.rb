require 'csv'
require_relative 'patient'

class PatientsRepository
  def initialize(csv_file, rooms_repository)
    @csv_file = csv_file
    @rooms_repository = rooms_repository
    @patients = []
    @next_id = 1
    load_csv
  end

  def create_patient(patient)
    @patients << patient
    patient.id = @next_id
    @next_id += 1
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row| # { id: '1', name: 'Joe', cured: 'false', blood_type: 'A' }
      row[:id]    = row[:id].to_i          # Convert column to Fixnum
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      patient = Patient.new(row) #{ id: 1, name: 'Joe', cured: false, blood_type: 'A' }
      #Assign the room to the patient
      room = rooms_repository.find(row[:room_id])
      patient.room = room
      @patients << patient
      @next_id = row[:id] + 1
    end
  end
end


repo = PatientsRepository.new('patients.csv')

ringo = Patient.new(name: 'ringo')

repo.create_patient(ringo)
p repo
