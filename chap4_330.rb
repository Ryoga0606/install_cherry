#4.8.4
dimensions = [
  #[縦,横]
  [10, 20],
  [30, 40],
  [50, 60]
]

areas = []
dimensions.each do |dimension|
  length = dimension[0]
  width = dimension[1]
  areas << length * width
end
p areas

dimensions = [
  #[縦,横]
  [10, 20],
  [30, 40],
  [50, 60]
]

areas = []
dimensions.each do |length, width|
  areas << length * width
end
p areas

dimensions.each do |length, width, foo, bar|
  p [length, width, foo, bar]
end

dimensions = [
  [10, 20, 100],
  [30, 40, 200],
  [50, 60, 300],
]
dimensions.each do |length, width|
  p [length, width]
end

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]
dimensions.each_with_index do |length, width, i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

dimensions.each_with_index do |dimension, i|
  length  = dimension[0]
  width = dimension[1]
  puts "length: #{length}, width: #{width}, i: #{i}"
end

dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

#4.8.5
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n; sum|
  sum = 10
  sum += n 
  p sum
end
p sum

#4.8.7
a = [1, 2, 3]
a.delete(100)
a.delete(100) do 
  p 'NG'
end
a. delete 100 do
  p 'NG'
end

#a.delete 100 { 'NG' }
a.delete(100) {p 'NG'}

#4.8.8
names = ['田中', '鈴木', '佐藤']
san_names = names.map {|name| p "#{name}さん"}
p san_names.join('と')

names = ['田中','鈴木','佐藤']
p names.map {|name| "#{name}さん"}.join('と')

names = ['田中','鈴木','佐藤']
names.map do |name|
  "#{name}さん"
end.join('と')

#4.9.1
sum = 0
5.times { |n| sum += n }
p sum

sum = 0
5.times { sum += 1}
p sum

#4.9.2
a = []
10.upto(14) { |n|  a << n }
p a 

a = []
14.downto(10){ |n| a << n }
p a 

#4.9.3
a = []
1.step(10, 2) { |n| a << n }
p a 

a = []
10.step(1,-2) { |n| a << n }
p a 

#4.9.4
a = []
while a.size < 5 
  a << 1
end
p a 

a = []
while a.size < 5 do a << 1 end
p a 

a = []

while false 
  a << 1
end
p a 

begin 
  a << 1
end while false
p a 

a = [10, 20, 30, 40, 50]
until a.size <= 3
  a.delete_at(-1)
end
p a 

#4.9.5
numbers = [1, 2, 3, 4]
sum = 0
for n in numbers
  sum += n 
end
p sum

sum = 0 
for n in numbers do sum += n end
p sum 

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n 
end
p sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n 
  sum += sum_value
end
#p n 
#p sum_value

sum = 0
for n in numbers
  sum_value = n.even? ? n * 10 : n 
  sum += sum_value
end
p n 
p sum_value

#4.9.6
#while true 
#end

#loop do
#end

numbers = [1, 2, 3, 4, 5]
loop do
  n = numbers.sample
  puts n 
  break if n == 5 
end

while true
  n = numbers.sample
  puts n 
  break if n == 5 
end 

p (1..4).map { |n|  n * 10 }
p 1.upto(5).select { |n| n.odd? }

p [1, 2, 3].class
p Array.include?(Enumerable)

p (1..3).class
p Range.include?(Enumerable)

p 1.upto(3).class
p Enumerator.include?(Enumerable)

#4.10.1
numbers = [1, 2, 3, 4, 5].shuffle
numbers.each do |n|
  puts n 
  break  if n == 5 
end

ret = 
  while true
    break
  end
p ret 

ret = 
  while true 
    break 123 
  end
p ret 

fruits = ['apple', 'melon', 'orange']
numbers = [1, 2, 3]
fruits.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    break if n == 3 
  end
end

#4.10.2
fruit = ['apple', 'melon', 'orange']
numbers = [1, 2, 3]
catch :done do 
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit},#{n}"
      if fruit == 'orange' && n == 3
        throw :done
      end
    end
  end
end

#fruits = ['apple', 'melon', 'orange']
#numbers = [1, 2, 3]
#catch :done do 
#  fruits.shuffle.each do |fruit|
#    numbers.shuffle.each do |n|
#      puts "#{fruit}, #{n}"
#      if fruit == 'orange' && n == 3
#        throw ;foo
#      end
#    end
#  end
#end

ret = 
  catch :done do 
    throw :done
  end
p ret 

ret = 
  catch :done do 
    throw :done, 123
  end
p ret 

#4.10.3
def greeting(country)
  return 'countryを入力してください' if country.nil?

  if country == 'japan'
    p 'こんにちは'
  else 
    p 'hello'
  end
end

def calc_with_break 
  numbers = [1, 2, 3, 4, 5]
  target = nil 
  numbers.shuffle.each do |n|
    target = n 
    break if n.even?
  end
  target * 10 
end
p calc_with_break

def calc_with_break
  numbers = [1, 2, 3, 4, 5]
  target = nil 
  numbers.shuffle.each do |n|
    target = n 
    return if n.even?
  end
  target * 10 
end
p calc_with_break

#[1, 2, 3].each do |n|
#  puts n 
#  return
#end

#4.10.4
numbers = [1, 2, 3, 4, 5]
numbers.each do |n|
  next if n.even?
  puts n 
end

numbers = [1, 2, 3, 4, 5]
i = 0 
while i < numbers.size
  n = numbers[i]
  i += 1
  next if n.even?
  puts n 
end

fruits = ['apple', 'melon', 'orange']
numbers = [1, 2, 3, 4, 5]
fruits.each do |fruit|
  numbers.each do |n|
    next if n.even?
    puts "#{fruit}, #{n}"
  end
end

#4.10.5
foods = ['ピーマン','トマト','セロリ']
foods.each do |food|
  print "#{food}は好きですか？　=> "
  answer = ['はい','いいえ'].sample
  puts answer

  redo unless answer == 'はい'
end

foods = ['ピーマン','トマト','セロリ']
count = 0 
foods.each do |food|
  print "#{food}は好きですか？　=> "
  answer = 'いいえ'
  puts answer

  count += 1
  redo if answer != 'はい' && count < 2 
  count = 0 
end

