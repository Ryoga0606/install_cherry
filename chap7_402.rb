class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    self.name = 'Bob'
  end

  def rename_to_carol
    self.name = 'Carol'
  end

  def rename_to_dave
    @name = 'Dave'
  end
end

user = User.new('Alice')
user.rename_to_bob
p user.name

user.rename_to_carol
p user.name

user.rename_to_dave
p user.name

#7.5.2
class Foo
  puts "クラス構文直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end

p Foo.bar

foo = Foo.new
p foo.baz

#class Foo
#  def self.bar
#    self.baz
#  end
#
#  def baz
#    self.baz
#  end
#end
#
#p Foo.bar
#
#foo = Foo.new
#p foo.baz

class Foo2
  def self.bar
    puts 'hello'
  end

  self.bar
end

class Foo3
  3.times do 
    puts 'Hello'
  end
end

#7.5.3
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = Product.format_price(price)
    "name; #{name}, price; #{formatted_price}"
  end
end

product = Product.new('A great movie', 1000)
p product.to_s

#Product.format_price(price)
#self.class.format_price(price)

#7.6.2
class User2
end

user = User2.new
p user.to_s 
p user.nil?

p User2.superclass
p user.methods.sort

#7.6.3
p user.class
p user.instance_of?(User2)
p user.instance_of?(String)

p user.instance_of?(Object)

p user.is_a?(User2)
p user.is_a?(Object)
p user.is_a?(BasicObject)

p user.is_a?(String)

#7.6.4
#class Product2
#end
#
#class DVD < Product2
#end

#7.6.5
class Product3
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

product = Product3.new('A great movie', 1000)
p product.name
p product.price

class DVD < Product3
  attr_reader :runnning_time

  def initialize(name, price)
    super#(name, price) super()だと引数０個でスーパークラスの同名メソッドを呼び出す
    #@runnning_time = runnning_time
  end
end

dvd = DVD.new('A great movie', 1000)
p dvd.name
p dvd.price
#p dvd.runnning_time

#7.6.6
class Product4
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
  def to_s
    "name: #{name}, price: #{price}"
  end

end

class DVD2 < Product4
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "#{super}, running_time: #{running_time}"
  end
end

product = Product4.new('A great movie', 1000)
p product.to_s

dvd = DVD2.new('An awesome film', 3000, 120)
p dvd.to_s

class Foo4
  def self.hello
    'hello'
  end
end

class Bar < Foo4
end

p Foo4.hello
p Bar.hello

#7.7.1
class User3
  def hello
    'hello!!'
  end
end
user = User3.new
p user.hello

class User4
  private

  def hello
    'Hello!'
  end
end
user = User4.new
#p user.hello

class User5
  def hello
    "Hello, I am #{name}"
  end

  private

  def name 
    'Alice'
  end
end
user = User5.new
p user.hello

#7.7.3
class Product5
  private

  def name 
    'A great movie'
  end
end

class DVD3 < Product5
  def to_s
    "name: #{name}"
  end
end

dvd = DVD3.new
p dvd.to_s

#7.7.4
class User6
  private

  def self.hello
    'Hello'
  end
end
p User6.hello

class User6
  class << self
    private

    def hello
      'Hello'
    end
  end
end

#p User6.hello

class User7
  def self.hello
    'Hello'
  end

  private_class_method :hello
end
#p User7.hello

#7.7.5
class User8
  private

  def foo
  end

  public

  def bar
  end

end

#7.7.6
class User9
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  private :foo, :bar

  def baz 
    'baz'
  end
end

user = User9.new
#p user.foo     
#p user.bar
p user.baz

#7.7.7
class User10
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  def weight
    @weight
  end

end

alice = User10.new('Alice', 50)
bob = User10.new('Bob', 60)
p alice.heavier_than?(bob)
p bob.heavier_than?(alice)
#p alice.weight

class Parent
  def initialize
    @first = 1
    @second = 2
    @third = 3
  end

  def number
    "#{@first}.#{@second}.#{@third}"
  end
end
class Child < Parent
  def initialize
    super
    @hour = 6
    @minute = 30
    @second = 59
  end

  def time 
    "#{@hour}:#{@minute}:#{@second}"
  end
end

parent = Parent.new
p parent.number

child = Child.new
p child.time

p child.number

#7.8.1
class Product
  DEFAULT_PRICE = 0

  private_constant :DEFAULT_PRICE
end

#p Product::DEFAULT_PRICE
