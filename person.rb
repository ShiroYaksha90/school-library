class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    input = @nameable.correct_name
    input.length <= 10 ? input : input[0..9]
  end
end
