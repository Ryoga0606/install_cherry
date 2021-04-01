class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

def full_name(user)
  "#{user.first_name} #{user.last_name}"
end

users.each do |user|
  puts "氏名: #{full_name(user)}}、年齢: #{user.age}"
end

p users[0].first_name
#p users[0].first_mame
#users[0].country = 'japan'
#users[0].first_name = 'Carol'

class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

users = []
users << User.new('Alice', 'Ruby', 20)
users << User.new('Bob', 'Python', 30)

users.each do |user|
  puts "氏名: #{user.full_name}、年齢: #{user.age}"
end

#7.2.2
alice = User.new('Alice', 'Ruby', 20)
bob = User.new('Bob', 'Python', 30)

p alice.full_name
p bob.full_name


user = User.new('Alice', 'Ruby', 20)
p user.first_name
#user.first_name = 'アリス'
p user.first_name

class User
  def initialize(name, age) 
    puts "name: #{name}, age: #{age}"
  end
end

class OrderItem
end

#7.3.1
#User.new
#user.initialized
User.new('Alice', 20)

#7.3.2
class User2
  def hello
    p "Hello"
  end
end

user = User2.new
user.hello

#7.3.3
class User3
  def initialize(name)
    @name = name
  end

  def hello 
    "Hello, I am #{@name}."
  end
end
user = User3.new('Alice')
p user.hello

class User4
  def initialize(name)
    @name = name
  end

  def hello
    shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}."
  end
end
user = User4.new('Alice')
p user.hello

class User5
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(value)
    @name = value
  end
end

user = User5.new('Alice')
user.name = 'Bob'
p user.name

class User6
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
user = User6.new('Alice')
#user.name = 'Bob'
p user.name

class User7
  attr_writer :name
  
  def initialize(name)
    @name = name
  end
end
user = User7.new('Alice')
user.name = 'Bob'
#p user.name

class User8
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

user = User8.new('Alice', 20)
p user.name
p user.age

#7.3.4
class User9
  def initialize(name)
    @name = name 
  end

  def hello
    "Hello,I am #{@name}"
  end
end
alice = User9.new('Alice')
p alice.hello

bob = User9.new('Bob')
p bob.hello

class User10
  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map do |name|
      User10.new(name)
    end
  end

  def hello
    "Hello, I am #{@name}."
  end
end

names = ['Alice', 'Bob', 'Carol']
users = User10.create_users(names)
users.each do |user|
  puts user.hello
end

#7.3.5
class Product
  DEFAULT_PRICE = 0

  attr_reader :name, :price 

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
p product.price

DEFAULT_PRICE = 0
UNITS = { m: 1.0, ft: 3.28, in: 39.37}

class Product2
  DEFAULT_PRICE = 0

  def self.default_price
    DEFAULT_PRICE
  end

  def default_price 
    DEFAULT_PRICE
  end
end

p Product2.default_price

product = Product2.new
p product.default_price 

class User11
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    "Hello, I am #{name}."
  end

  def hi
    "Hi, I am #{self.name}."
  end

  def my_name
    "My name is #{@name}."
  end
end
user = User11.new('Alice')
p user.hello
p user.hi
p user.my_name

#7.5.1
class User12
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    name = 'Bob'
  end

  def rename_to_carol
    
