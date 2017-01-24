class Patient

  #STATES?
  attr_accessor :room, :id
  def initialize(args = {})
    @id = args[:id]
    @name = args[:name] # String
    @cured = args[:cured] || false # Boolean
    @blood_type = args[:blood_type] || 'A'
    @room = nil
  end
end


# joe = Patient.new(name: 'Joe')
# p joe

# bob = Patient.new(cured: true, name: 'Bob')
# p bob

# henry = Patient.new(name: 'Henry', blood_type: 'A')
# p henry
