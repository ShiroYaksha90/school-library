require_relative 'person'
class Teacher < Person
  def initialize(age, specialization, _name = 'Unknown')
    super('Unknown', age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
