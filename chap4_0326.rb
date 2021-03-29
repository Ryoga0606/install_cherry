#1..5最後の値を含む
#1...5最後の値を含まない

#4.5
puts (1..5).class
puts (1...5).class

range = 1..5
puts range.include?(0)
puts range.include?(1)
puts range.include?(4.9)
puts range.include?(5)
puts range.include?(6)

range = 1...5
puts range.include?(0)
puts range.include?(1)
puts range.include?(4.9)
puts range.include?(5)
puts range.include?(6)

#4.5.1
a = [1, 2, 3, 4, 5]
puts a[1..3]

a = 'abcdef'
puts a[1..3]


def liquid?(temperature)
  0 <= temperature && temperature < 100
end
puts liquid?(-1)
puts liquid?(0)
puts liquid?(99)
puts liquid?(100)

def liquid?(temperature)
  (0...100).include?(temperature)
end
puts liquid?(-1)
puts liquid?(0)
puts liquid?(99)
puts liquid?(100)

def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end
puts charge(3)
puts charge(12)
puts charge(16)
puts charge(25)


puts (1..5).to_a
puts (1...5).to_a

puts ('a'..'e').to_a
puts ('a'...'e').to_a

puts ('bad'..'bag').to_a
puts ('bad'...'bag').to_a

puts [*1..5]
puts [*1...5]

numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n }
puts sum

sum = 0
(1..4).each { |n| sum += n }
puts sum

numbers = []
(1..10).step(2) { |n| numbers << n}
puts numbers

puts 0.to_s(16)
puts 255.to_s(16)

puts '0'.rjust(5)
puts '0'.rjust(5, '0')
puts '0'.rjust(5, '_')

#to_ints('#000000')
#to_ints('#ffffff')
#to_ints('#043c78')

a = [1, 2, 3, 4, 5]
puts a[1, 3]

a = [1, 2, 3, 4, 5]
puts a.values_at(0, 2, 4)

a = [1, 2, 3]
puts a[a.size - 1]

a = [1, 2, 3]
puts a[-1]
puts a[-2]
puts a[-2, 2]

a = [1, 2, 3]
puts a.last
puts a.last(2)

a = [1, 2, 3]
puts a.first
puts a.first(2)

#4.7.2
a = [1, 2, 3]
a[-3] = -10
puts a
#a[-4] = 0

a = [1, 2, 3, 4, 5]
a[1, 3] = 100
puts a

a = []
a.push(1)
a.push(2, 3)
puts a

a = [1, 2, 3, 1, 2, 3]
a.delete(2)
puts a

a.delete(5)
puts a

#4.7.3
a = [1]
b = [2, 3]
puts a.concat(b)
puts a 
puts b 

a = [1]
b = [2, 3]
puts a + b
puts a 
puts b

#4.7.4
a = [1, 2, 3]
b = [3, 4, 5]
puts a | b

a = [1, 2, 3]
b = [3, 4, 5]
puts a - b

a = [1, 2, 3]
b = [3, 4, 5]
puts a & b


require 'set'
a = Set.new([1, 2, 3])
b = Set.new([3, 4, 5])
puts a | b 
puts a - b 
puts a & b 

#4.7.5
e, f = 100, 200, 300
puts e 
puts f

e, *f = 100, 200, 300
puts e 
puts f

#4.7.6
a = []
a.push(1)
a.push(2, 3)
puts a 

a = []
b = [2, 3]
a.push(1)
a.push(b)
p a 

a = []
b = [2, 3]
a.push(1)
a.push(*b)
p a 

def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end

puts greeting('田中さん')
puts greeting('田中さん','鈴木さん')
puts greeting('田中さん','鈴木さん','佐藤さん')

#4.7.8
a = [1, 2, 3]
p [a]
p [*a]

a = [1, 2, 3]
p [-1, 0, *a, 4, 5]

a = [1, 2, 3]
p [-1, 0] + a + [4, 5]

#4.7.9
puts [1, 2, 3] == [1, 2, 3]
puts [1, 2, 3] == [1, 2, 4]
puts [1, 2, 3] == [1, 2]
puts [1, 2, 3] == [1, 2, 3, 4]

#4.7.10
p ['apple', 'melon', 'orange']
p %w!apple melon orange!
p %w(apple melon orange)
p %w(
  apple
  melon
  orange
)
p %w(big\ apple small\ melon orange)

prefix = 'This is'
p %W(#{prefix}\ an\ apple small\nmelon orange)

#4.7.11
p 'Ruby'.chars
p 'Ruby,Java,Perl,PHP'.split(',')

a = Array.new
p a

a = Array.new(5)
p a 

a = Array.new(5, 0)
p a 

a = Array.new(10){ |n| n % 3 + 1}
p a 

#4.7.13
a = Array.new(5, 'default')
p a 

str = a[0]
p str

str.upcase!
p str 
p a 

a = Array.new(5) { 'default' }
p a  

str = a[0]
p str 

str.upcase!
p str

p a 

#4.7.14
a = Array.new(5, 0)
p a 

n = a[0]
p n 

a = 'abcde'
p a[2]
p a[1, 3]
p a[-1]
a[0] = 'X'
p a 
a[1, 3] = 'Y'
p a 
a << 'PQR'
p a 

#4.8.1
fruits = ['apple', 'orange', 'melon']
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}" }

#4.8.2
fruit = ['apple', 'orange', 'melon']
p fruit.map.with_index { |fruit, i| "#{i}: #{fruit}"}

fruit = ['apple', 'orange', 'melon']
p fruit.delete_if.with_index { |fruit, i| fruit.include?('a') && i.odd?}

fruit = ['apple', 'orange', 'melon']
p fruit.each
p fruit.map
p fruit.delete_if

#4.8.3
fruits = ['apple', 'orange', 'melon']
fruits.each.with_index(1) { |fruit, i| puts "#{i}: #{fruit}"}
p fruits.map.with_index(10) { |fruit, i| "#{i}: #{fruit}" }
