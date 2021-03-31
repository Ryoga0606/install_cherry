#5.1.2
#convert_length(1, 'm', 'in')
#convert_length(15, 'in', 'm')
#convert_length(35000, 'ft', 'm')

#5.2
{}.class

#{
#  'japan' => 'yen',
#  'us' => 'dollar',
#  'india' => 'rupee'
#}

#{'japan' => 'yen', 'japan' => '円' }
h = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

[1, 2, 3].each { |n| puts n }

#5.2.1
currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
currencies['italy'] = 'euro'
p currencies

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
currencies['japan'] = '円'
p currencies

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
p currencies['india']
p currencies['brazil']

#5.2.2
currencies = { 'japan' => 'yen', 'us' => 'dollar', 'imdia' => 'rupee'}

currencies.each do |key, value|
  puts "#{key} : #{value}"
end

#5.2.3
a = { 'x' => 1, 'y' => 2, 'z' => 3 }

b = { 'x' => 1, 'y' => 2, 'z' => 3 }
puts a == b 

c = { 'z' => 3, 'y' => 2, 'x' => 1}
puts a == c 

d = { 'x' => 10, 'y' => 2, 'z' => 3 }
puts a == d 

a = {}.length
p a 

a = { 'x' => 10, 'y' => 2, 'z' => 3 }.size
p a 

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.delete('japan')
puts currencies

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
p currencies.delete('italy')
currencies.delete('italy') { |key| p "Not found: #{key}"}

puts :apple
puts :japan
puts :ruby_is_fun

#5.3.1
p :apple.class
p 'apple'.class

p :apple.object_id
p :apple.object_id
p :apple.object_id

p 'apple'.object_id
p 'apple'.object_id
p 'apple'.object_id

string = 'apple'
string.upcase!
p string

symbol = :apple
#symbol.upcase!

#5.3.2
currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
p currencies['japan']

currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee'}
p currencies[:japan]

p 'apple'.methods
p :apple.methods

#5.4.1
currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
p currencies[:us]
currencies[:italy] = 'euro'

currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies[:us]

currencies = { japan: :yen, us: :dollar, india: :rupee }
p currencies

#5.4.2
hash = { 'abc' => 123, def: 456 }
p hash['abc']
p hash[:def]

p hash[:abc]
p hash['def']

person = {
  name: 'Alice',
  age: 20,
  friends: ['Bob', 'Carol'],
  phones: { home: '1234-0000', mobile: '5678-0000' }
}
puts person[:age]
p person[:friends]
puts person[:phones][:mobile]

#5.4.3
def buy_burger(menu, drink, poteto)
  if drink
    #ドリンクを購入
  end
  if poteto
    #ポテトを購入
  end
end

buy_burger('cheese',true,true)
buy_burger('fish',true,true)

def buy_burger(menu, drink: true, potato: true)
end
buy_burger('cheese', drink: true, potato: true)
buy_burger('fish', drink:true, potato: false)
buy_burger('fish', potato: false)
buy_burger('cheese')
buy_burger('fish', potato: false, drink: true )
#buy_burger('fish', salad: true)

def buy_burger(menu, drink:, potato:)
end

buy_burger('cheese', drink: true, potato: true)
#buy_burger('fish', potato: false)

params = { drink: true, potato: false }
buy_burger('fish', params)

#5.5.1

#5.6.1
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys
p currencies.values
p currencies.has_key?(:japan)
p currencies.has_key?(:italy)

#5.6.2
h = { us: 'dollar', india: 'rupee' }
a = { japan: 'yen', **h}
p a 
# {japan: 'yen', h }
h = { us: 'dollar', india: 'rupee' }
a = { japan: 'yen'}.merge(h)
p a 

#5.6.3
def buy_burger(menu, options = {})
  drink = options[:drink]
  potato = options[:potato]
end
buy_burger('cheese', drink: true, potato: true)
buy_burger('fish', salad: true)

#5.6.4
def buy_burger(menu, options = {})
  drink = options[:drink]
  potato = options[:potato]
end

#buy_burger('fish', drink: true, potato: false, salad: true, chicken: false )

def buy_burger(menu, drink: true, potato: true, **others)
  puts others
end

buy_burger('fish', drink:true, potato: false, salad: true, chicken: false )

#5.6.5
def buy_burger(menu, options = {})
  puts options
end

p buy_burger('fish', {'drink' => true, 'potato' => false})

def buy_burger(options = {}, menu)
    puts options
end

#buy_burger('drink' => true, 'potato' => false, 'fish')
buy_burger({'drink' => true, 'potato' => false}, 'fish' )

#5.6.6
puts('Hello')
puts 'Hello'

#buy_burger {'drink' => true, 'potato' => false}, 'fish'
buy_burger({'drink' => true, 'potato' => false}, 'fish')

def buy_burger(menu, options = {})
  puts options
end

buy_burger 'fish', {'drink' => true, 'potato' => false}
buy_burger 'fish', 'drink' => true, 'potato' => false

#5.6.7
currencies = { japan: 'yen', us: 'dollar', india: 'rupee'}
p currencies.to_a

array = [[:japan, "yen"],[:us, "dollar"],[:india, "rupee"]]
p array.to_h

array = [1, 2, 3, 4]
#array.to_h

array = [[:japan, "yen"],[:japan, "円"]]
p array.to_h

array = [[:japan, "yen"],[:us, "dollar"],[:india, "rupee"]]
p Hash[array]

array = [:japan, "yen", :us, "dollar", :india, "rupee"]
p Hash[*array]

#5.6.8
h = {}
p h[:foo]

h = Hash.new('hello')
p h[:foo]
a = h[:foo]
b = h[:bar]

p a.equal?(b)

a.upcase!
p a 
p b 

p h 

h = Hash.new { |hash, key| hash[key] = 'hello' }
p h[:foo]
p h[:bar]
p h 

#5.7.1
:apple
:Aplle
:ruby_is_fun
:okay?
:welcome!
:_secret
:$dollar
:@at_mark

#:12345
:'12345'

name = 'Alice'
p :"#{name.upcase}"

hash = { 'abc': 123 }

#5.7.2
p %s!ruby is fun!
%s(ruby is fun)

p %i(apple orange melon)

name = 'Alice'
p %i(hello\ngood-bye #{name.upcase})
p %I(hello\ngood-bye #{name.upcase})

#5.7.3
string = 'apple'
symbol = :apple

p string == symbol
#p string + symbol

string.to_sym
p string.to_sym == symbol

p symbol.to_s
p string == symbol.to_s
p string + symbol.to_s

p 'apple'.respond_to?('include?')
p 'apple'.respond_to?(:include?)

p 'apple'.respond_to?('foo_bar')
p 'apple'.respond_to?(:foo_bar)

p 'apple'.include?('pp')
#p 'apple'.include?(:pp)

def foo(a, b, c = 3, d = 4, *ef, g, h, i: 9, j: 10, **kl, &block )
  "a: #{a}, b: #{b}, c: #{c}, ef: #{ef}, g: #{g}, h: #{h}, i: #{i}, j: #{j}, kl: #{kl},block: #{block}"
end
p foo(1, 2, 3, 4, 5, 6, 7, 7, i: 9, j: 10, k: 11, l: 12) { 13 }

def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end

def show_currency(country)
  currency = find_currency(country)
  if currency
    currency.upcase
  end
end

p show_currency(:japan)
p show_currency(:brazil)

def show_currency(country)
  if currency = find_currency(country)
    currency.upcase
  end
end

a = 'foo'
p a&.upcase

a = nil
p a&.upcase

def show_currency(country)
  currency = find_currency(country)
  currency&.upcase
end

limit ||= 10
limit = nil
limit ||= 10
p limit 

limit = 20
limit ||= 10
p limit 
limit = limit || 10 

def user_exists?
  user = find_user
  if user 
    true
  else
    false
  end
end

def user_exists?
  !!find_user
end

p !!true
p !!1
p !!false
p !!nil
