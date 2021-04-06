
#class Product
#  def foo
#    DEFAULT_PRICE = 0
#  end
#end

#7.8.1
class Product
  DEFAULT_PRICE = 0
  DEFAULT_PRICE = 1000
end

p Product::DEFAULT_PRICE
Product::DEFAULT_PRICE = 3000

p Product::DEFAULT_PRICE

Product.freeze
#Product::DEFAULT_PRICE = 5000

#class Product2
#  DEFAULT_PRICE = 0
#  freeze
#  DEFAULT_PRICE = 1000
#end

#7.8.2
class Product2
  NAME = 'A product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  SOME_PRICES = { 'Foo' => 1000, 'Bar' => 2000, 'Baz' => 3000 }
end

Product2::NAME.upcase!
p Product2::NAME

Product2::SOME_NAMES << 'Hoge'
p Product2::SOME_NAMES

Product2::SOME_PRICES['Hoge'] = 4000
p Product2::SOME_PRICES

class Product3
  SOME_NAMES = ['Foo', 'Bar', 'Baz']

  def self.names_without_foo(names = SOME_NAMES)
    names.delete('Foo')
    names 
  end
end

p Product3.names_without_foo

p Product3::SOME_NAMES

class Product4
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    names.delete('Foo')
    names 
  end
end

#p Product4.names_without_foo

Product4::SOME_NAMES[0].upcase!
p Product4::SOME_NAMES

class Product5
  #SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze].freeze
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze
end

#p Product::SOME_NAMES[0].upcase!

#class Product
#  SOME_VALUE = 0
#  SOME_TYPE = :foo
#  SOME_FLAG = true
#end

#7.9.1
class Product6
  @name = 'Product'

  def self.name
    @name
  end

  def initialize(name)
    @name = name
  end

  def name 
    @name
  end
end

p Product6.name

product = Product6.new('A great movie')
p product.name
p Product6.name

class Product6
  #クラスインスタンス変数
  @@name = 'Product'

  def self.name
    #クラスインスタンス変数
    @@name
  end

  def initialize(name)
    #インスタンス変数
    @@name = name
  end

  def name
    #インスタンス変数
    @@name
  end
end

class DVD < Product6
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

p Product6.name
p DVD.name

product = Product6.new('A great movie')
p product.name

dvd = DVD.new('An awesome film')
p dvd.name
p dvd.upcase_name

p Product6.name
p DVD.name

#7.9.2
$program_name = 'Awesome program'

class Program 
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

p Program.name

program = Program.new('Super program')
p program.name

p Program.name
p $program_name

#7.10.1
s = 'Hello'
p s.length
p s.size

class User
  def hello
    'Hello'
  end

  alias greeting hello
end

user = User.new
p user.hello
p user.greeting

#7.10.2
class User
  undef freeze 
end

user = User.new
#p user.freeze

#7.10.3
class User
  class BloodType
    attr_reader :type 

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B')
p blood_type.type

#7.10.4
class User2
  #=でおわるメソッドを定義する
  def name=(value)
    @name = value
  end
end

user = User2.new
user.name = 'Alice'

class Product7
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other)
    if other.is_a?(Product7)
      code == other.code
    else
      false
    end
  end
end

a = Product7.new('A-0001', 'A great movie')
b = Product7.new('B-0001', 'An awesome film')
c = Product7.new('A-0001', 'A great movie')

p a == b 
p a == c
 
p a == 1
p a == 'a'

p a.==(b)
p a.==(c)

p 1 == a

a = 'abc'
b = 'abc'

p a.equal?(b)

c = a 
p a.equal?(c)

p 1 == 1.0

h = { 1 => 'Integer', 1.0 => 'Float' }
p h[1]
p h[1.0]

p 1.eql?(1.0)

a = 'japan'
b = 'japan'

p a.eql?(b)
p a.hash
p b.hash

c = 1 
d = 1.0
p c.eql?(d)
p c.hash
p d.hash

text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

value = [1, 2, 3]

case value 
when String 
  puts '文字列です'
when Array
  puts '配列です'
when hash
  puts 'ハッシュです'
end

#7.10.6
class MyString < String
  #Stringクラスを拡張するためのコードを書く
end
s = MyString.new('Hello')
p s 
p s.class 

class MyArray < Array
  #Arrayクラスを拡張するためのコードを書く
end
a = MyArray.new()
a << 1
a << 2 
p a 
p a.class

class String
  #文字列をランダムにシャッフルする
  def shuffle
    chars.shuffle.join
  end
end

s = 'Hello, I am Alice.'
p s.shuffle
p s.shuffle

#'MyString'.underscore

#numbers = [1, 2, 3]
#p 2.in?(numbers)
#p 5.in?(numbers)

class User3
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}"
  end
end

user = User3.new('Alice')
p user.hello

class User3
  def hello
    "#{@name}さん、こんにちは！"
  end
end

p user.hello

class User4
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

class User4
  alias hello_original hello

  def hello
    "#{hello_original}じゃなくて、#{@name}さん、こんにちは！"
  end
end

user = User4.new('Alice')
p user.hello

#7.10.7
alice = 'I am Alice.'
bob = 'I am Bob'

def alice.shuffle
  chars.shuffle.join
end

p alice.shuffle
p bob.shuffle

#n = 1
#def n.foo
#  'foo'
#end

#sym = :alice
#def sym.bar
#  'bar'
#end

alice = 'I am Alice.'
class << alice
  def shuffle
    chars.shuffle.join
  end
end
p alice.shuffle

#7.10.8
class User5
  def self.hello
    'Hello.'
  end

  class << self
    def hi 
      'Hi.'
    end
  end
end

alice = 'I am alice.'

def alice.hello
  'Hello.'
end

class << alice
  def hi 
    'Hi.'
  end
end

class User
end

def User.hello
  'Hello.'
end

class << User
  def hi 
    'Hi.'
  end
end

p User.hello
p User.hi

#7.10.9
def display_name(object)
  puts "Name is <<#{object.name}>>"
end

class User
  def name 
    'Alice'
  end
end

class Product8
  def name 
    'A great movie'
  end
end

user = User.new
display_name(user)

product = Product8.new
display_name(product)

class Product9
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    #stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり':'なし'
    "商品名: #{@name} 価格:#{@price}円　在庫: #{stock}"
  end
end

class DVD2 < Product9
  #在庫があればtrueを返す
  def stock? 
    true
  end
end

product = Product9.new('A great film', 1000)
#p product.display_text

dvd = DVD2.new('An awesome film', 3000)
p dvd.display_text

class Product10
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    #stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり':'なし'
    "商品名: #{@name} 価格:#{@price}円　在庫: #{stock}"
  end

  def stock?
    raise 'Must implement stock? in subclass.'
  end
end

product = Product10.new('A great film', 1000)
#p product.display_text

s = 'Alice'
p s.respond_to?(:split)
p s.respond_to?(:name)

def display_name(object)
  if object.respond_to?(:name)
    puts "Name is <<#{object.name}>>"
  else
    puts 'No name.'
  end
end

def add_ten(n)
  n.to_i + 10
end

p add_ten(1)

p add_ten('2')
p add_ten(nil)

def add_numbers(a = 0,b = 0)
  a + b 
end

p add_numbers
p add_numbers(1)
p add_numbers(1, 2)

