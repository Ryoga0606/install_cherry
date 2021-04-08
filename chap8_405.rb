#8.2.2
module Greeter
  def hello
    'hello'
  end
end

#greeter = Greeter.new
#module AwesomeGreeter < Greeter
#end

#8.3.1
class Product
  def title 
    log 'title is called.'
    'A great movie'
  end

  private

  def log(text)
    #本来であれば標準ライブラリのLoggerクラスなどを使うべきだが、簡易的にputsで済ませる
    puts "[LOG] #{text}"
  end
end

class User
  def name
    log 'name is called.'
    'Alice'
  end

  private

  #このメソッドの実装はProductクラスのlogメソッドと全く同じ
  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
p product.title

user = User.new
p user.name

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product2

  include Loggable

  def title
    log 'title is called'
    'A great movie'
  end
end

class User2
  include Loggable

  def name 
    log 'name is called.'
    'Alice'
  end
end

product = Product2.new
p product.title

user = User2.new
p user.name

#module Loggable
  #  private 

#  def log(text)
    #    puts "[LOG] #{text}"
    #  end
  #end

class Product3

  include Loggable

  def title
    log 'title is called'
    'A great movie'
  end
end

product = Product3.new
#p product.log 'public?'

#8.3.2
class Product4 
  #Loggableモジュールのメソッドを特異メソッド（クラスメソッド）としてミックスインする
  extend Loggable

  log 'Defined Product class.'

  def self.creat_products(names)
    #logメソッドをクラスメソッド内で呼び出す
    #（つまりlogメソッド自体もクラスメソッドになっっている）
    log 'creat_products is called.'
  end
end

Product4.creat_products([])
Product4.log('Hello.')

#8.4.1
module DeepFreezable
  def deep_freeze(array_or_hash)
    #deep_freezeメソッドの実装
  end
end

class Team
  extend DeepFreezable

  COUNTRIES = deep_freeze(['Japan', 'US', 'India'])
end

class Bank
  extend DeepFreezable

  CURRENCIES = deep_freeze({ 'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' }) 
end

p Product2.include?(Loggable)
p Product2.included_modules
p Product2.ancestors
product = Product2.new
p product.class.include?(Loggable)
p product.class.included_modules

p product.is_a?(Product2)
p product.is_a?(Loggable)
p product.is_a?(Object)

#8.5.2
module Taggable
  def price_tag
    #priceメソッドはinclude先で定義されているはず、という前提
    "#{price}円"
  end
end

class Product5
  include Taggable

  def price
    1000
  end
end

product = Product5.new
p product.price_tag

module Taggable
  def price_tag
    #あえてselfをつけて呼び出してもいい(privateメソッドでなければ)
    #selfはinclude先のクラス（例えばProductクラス）のインスタンスになる
    "#{self.price}円"
  end
end

#8.5.3
p Array.include?(Enumerable)
p Hash.include?(Enumerable)
p Range.include?(Enumerable)

p [1, 2, 3].map { |n| n * 10 }
a = { a: 1, b: 2, c: 3 }.map { |k, v| [k, v * 10] }
p a
p (1..3).map { |n| n * 10}

p [1, 2, 3].count
a = { a: 1, b: 2, c: 3 }.count
p a 
p (1..3).count
