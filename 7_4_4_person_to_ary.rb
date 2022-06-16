class Person
  attr_accessor :name, :age, :email

  def to_ary
    [name, age, email]
  end
end

david = Person.new
david.name = 'David'
david.age = 55
david.email = 'david@wherever'
array = []
array.concat(david)
p array
