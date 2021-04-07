p 2 <=> 1
p 2 <=> 2
p 1 <=> 2
p 2 <=> 'abc'

p 'xyz' <=> 'abc'
p 'abc' <=> 'abc'
p 'abc' <=> 'xyz'
p 'abc' <=> 123

p 2 > 1
p 2 <= 1
p 2 == 1

p 'abc' > 'xyz'
p 'abc' <= 'xyz'
p 'abc' == 'xyz'

class Tempo
  include Comparable

  attr_reader :bpm 

  def initialize(bpm)
    @bpm = bpm
  end

  def <=>(other)
    if other.is_a?(Tempo)
      bpm <=> other.bpm 
    else
      nil
    end
  end

  def inspect 
    "#{bpm}bpm"
  end
end

t_120 = Tempo.new(120)
p t_120

t_180 = Tempo.new(180)

p t_120 > t_180
p t_120 <= t_180
p t_120 == t_180

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
p tempos.sort 

#8.5.5
p Object.include?(Kernel)

#8.5.6
p self 
p self.class
class User
  p self 
  p self.class
end

class User
end

p User.class
p Class.superclass

module Loggable
end

p Loggable.class
p Module.superclass

module Loggable
  p self
  p self.class
end

#8.5.8
module NameChanger
  def change_name
    #include先のクラスのインスタンス変数を変更する
    @name = 'ありす'
  end
end

class User 
  include NameChanger

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
p user.name

user.change_name
p user.name

module NameChanger
  def change_name
    #セッターメソッド経由でデータを変更する
    self.name = 'ありす'
  end
end

class User
  include NameChanger

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new('alice')
user.change_name
p user.name

#8.5.9
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

s = 'abc'
#s.log('Hello.')

s.extend(Loggable)
s.log('Hello.')

#8.6.1
#class second
#  def initialize(player, uniform_number)
#    @player = player
#    @uniform_number = uniform_number
#  end
#end
#
#class second
#  def initialize(digits)
#    @digits = digits
#  end
#end
#
#Second.new('Alice')
#Second.new(13)

module Baseball
  #これはBaseballモジュールに属するSecondクラス
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  #これはClockモジュールに属するSecondクラス
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end

p Baseball::Second.new('Alice', 13)
p Clock::Second.new(13)

#8.6.3
module Baseball
end

class Baseball::Second
  def initialize(player, uniform_number)
    @player = player
    @uniform_number = uniform_number
  end
end

#8.7.1
module Loggable
  #特異メソッドとしてメソッドを定義する
  def self.log(text)
    puts "[LOG] #{text}"
  end
end

Loggable.log('Hello.')

module Loggable
  class << self 
    def log(text)
      puts "[LOG] #{text}"
    end

    #以下、他の特異メソッドを定義
  end
end
Loggable.log('Hello.')

module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
  # logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
  # (module_functionは対象メソッドの定義よりも下で呼び出すこと)
  module_function :log
end

Loggable.log('Hello.')

class Product 
  include Loggable

  def title 
    log 'title is called'
    'A great movie'
  end
end

product = Product.new
p product.title
#product.log 'Hello'

module Loggable
  module_function

  def log(text)
    puts "[LOG] #{text}"
  end
end

#8.7.3
module Loggable
  #定数を定義する
  PREFIX = '[LOG]'.freeze

  def log(text)
    puts "#{PREFIX} #{text}"
  end
end

p Loggable::PREFIX
#8.7.4
p Math.sqrt(2)

class Calculator
  include Math

  def calc_sqrt(n)
    sqrt(n)
  end
end
calculator = Calculator.new
p calculator.calc_sqrt(2)

p Math::E
p Math::PI

Kernel.puts "Hello."
Kernel.p [1, 2, 3]

#8.8
module AwesomeApi
  @base_url = ''
  @debug_mode = false

  class << self
    def base_url=(value)
      @base_url = value
    end

    def base_url
      @base_url
    end

    def debug_mode=(value)
      @debug_mode = value
    end

    def debug_mode
      @debug_mode
    end

    #上ではわかりやすくするために明示的にメソッドを定義したが、本来は以下の１行で済む
    # attr_accessor :base_url, :debug_mode
  end
end

AwesomeApi.base_url = 'http://example.com'
AwesomeApi.debug_mode = true

p AwesomeApi.base_url
p AwesomeApi.debug_mode

require 'singleton'

class Configuration
  include Singleton

  attr_accessor :base_url, :debug_mode

  def initialize
    @base_url = ''
    @debug_mode = false 
  end
end

#config = Configuration.new

config = Configuration.instance 
config.base_url = 'http://example.com'
config.debug_mode = true

other = Configuration.instance 
p other.base_url
p other.debug_mode

p config.object_id
p other.object_id
p config.equal?(other)

module AwesomeApi
  @base_url = ''
  @debug_mode = false

  class << self 
    attr_accessor :base_url, :debug_mode
  end
end

module AwesomeApi
  class Engine
  end
end

#8.9.1
module A 
  def to_s 
    "<A> #{super}"
  end
end

module B 
  def to_s 
    "<B> #{super}"
  end
end

class Product 
  def to_s 
    "<Product> #{super}"
  end
end

class DVD < Product 
  include A 
  include B 

  def to_s 
    "<DVD> #{super}"
  end
end

dvd = DVD.new
p dvd.to_s 

p DVD.ancestors
#p dvd.foo

#8.9.2
#module Greeting 
#  def hello 
#    'hello.'
#  end
#end
#
#module Aisatsu 
#  include Greeting 
#
#  def konnichiwa 
#    'こんにちは。'
#  end
#end
#
#class User 
#  include Aisatsu 
#end
#
#user = User.new 
#
#p user.konnichiwa 
#p user.hello 

#8.9.3
module A 
  def to_s 
    "<A> #{super}"
  end
end

class Product 
  prepend A 

  def to_s 
    "<Product> #{super}"
  end
end

product = Product.new
p product.to_s 

p Product.ancestors

#8.9.4
class Product2
  def name 
    "A great film"
  end
end

product = Product2.new
p product.name

#class Product2 
#  alias name_original name 
#
#  def name 
#    "<<#{name_original}>>"
#  end
#end
#
#p product.name

module NameDecorator
  def name 
    "<<#{super}>>"
  end
end

class Product2
  prepend NameDecorator 
end
product = Product2.new
p product.name 

class User2
  def name 
    'Alice'
  end
end

class User2 
  prepend NameDecorator
end

user = User2.new 
p user.name 

Product2.prepend NameDecorator

#8.9.5
module StringShuffle 
  refine String do 
    def shuffle 
      chars.shuffle.join
    end
  end
end
#p 'Alice'.shuffle

class User 
  using StringShuffle

  def initialize(name)
    @name = name 
  end

  def shuffled_name 
    @name.shuffle 
  end

end
user = User.new('Alice')
p user.shuffled_name 

#p 'Alice'.shuffle

module SomeModule 
  refine Object do 
  end

  refine String do 
  end
end

module Sample 
  class User
    NAME = 'Alice'.freeze 

    def self.hello(name = NAME )
      "Hello, I am #{name}"
    end
  end
end
p Sample::User::NAME 
p Sample::User.hello
p Sample::User::hello

s = 'abc'
p s::upcase 

#Sample.User::NAME
#Sample::User.NAME
