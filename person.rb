class Person
def initialize(name="Unknown", age, parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
end
attr_accessor :name,:age
attr_reader :id
def can_use_services?
    @parent_permission || of_age?
end
private
def of_age?
    @age >= 18
end
end
