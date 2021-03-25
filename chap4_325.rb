#4.1.2
#to_hex(0, 0, 0)
#to_hex(255, 255, 255)
#to_hex(4, 60, 120)
#to_ints('#000000')
#to_ints('#ffffff')
#to_ints('#043c78')

#4.2
puts [].class
puts a = [1, 2, 3]
puts a = [
  1,
  2,
  3
]
puts a = [
  1,
  2,
  3,
]

puts a = ['apple','orange','melon']
puts a = [1,'apple',2,'orange',3,'melon']
puts a = [[10, 20, 30],[40, 50, 60],[70, 80, 90]]

a = [1, 2, 3]
puts a[0]
puts a[1]
puts a[2]
puts a[100]

puts a.size
puts a.length

a[1] = 20
puts a

a = [1, 2, 3]
a[4] = 50
puts a

a = []
a << 1
a << 2
a << 3
puts a

a.delete_at(1)
puts a
a.delete_at(100)
puts a


a,b = 1,2
puts a
puts b

a, b = [1, 2]
puts a 
puts b 

c, d = [10]
puts c 
puts d 

e, f = [100, 200, 300]
puts e 
puts f 

puts 14.divmod(3)
quo_rem = 14.divmod(3)
puts "商=#{quo_rem[0]}, 余り=#{quo_rem[1]}"

quotient, remainder = 14.divmod(3)
puts "商=#{quotient}, 余り=#{remainder}"

#4.3.1
numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n 
end
puts sum

#4.3.3
a = [1, 2, 3, 1, 2, 3]
a.delete(2)
puts a

a = [1, 2, 3, 1, 2, 3]
a.delete_if do |n|
  n.odd?
end
puts a

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum += n 
end

numbers.each do |i|
  sum += i
end

numbers.each do |number|
  sum += number
end

numbers.each do |element|
  sum += element
end

numbers.each do 
  sum += 1
end

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n 
  sum += sum_value
end
puts sum
#puts sum_value

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n 
  sum += sum_value
end

numbers = [1, 2, 3, 4]
sum = 0
sum_value = 100

numbers.each do |sum_value|
  sum += sum_value
end
puts sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n| sum += n end
puts sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n}
puts sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n|
  sum += n
}
puts sum

#4.4.1
numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
puts new_numbers

new_numbers = numbers.map { |n| n * 10}
puts new_numbers

numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.select{ |n| n.even? }
puts even_numbers

numbers = [1, 2, 3, 4, 5, 6]
non_multiples_of_three = numbers.reject{ |n| n % 3 == 0}
puts non_multiples_of_three

numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.find{ |n| n.even?} 
puts even_numbers

numbers = [1, 2, 3, 4]
sum = 0
numbers.each{ |n| sum += n}
puts sum

numbers = [1, 2, 3, 4]
sum = numbers.inject(0) { |result,n| result + n }
puts sum

puts ['Mon','Tue','Wed','Thu','Fri','Sat'].inject('Sun') { |result,s| result + s}

puts ['ruby','java','perl'].map { |s| s.upcase}
puts ['ruby','java','perl'].map(&:upcase)

[1, 2, 3, 4, 5, 6].select { |n| n % 3 == 0}
[9, 10, 11, 12].map { |n| n.to_s(16)}
[1, 2, 3, 4].map do |n|
  m = n * 4
  m.to_s
end


