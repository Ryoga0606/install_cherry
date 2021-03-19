#2.10.5
n = 11
if n > 10
    puts '10より大きい'
else
    puts '10以下'
end

n = 11
puts n > 10 ?  '10より大きい':  '10以下'

n = 11
message = n > 10 ? '10より大きい':'10以下'
puts message

#2.11.1
def greeting(country)
    if country == 'japan'
        puts 'こんにちは'
    else
        puts 'Hello'
    end
end
#puts greeting
puts greeting('us')
#puts greeting('us','japan')

def greeting(country = 'japan')
    if country == 'japan'
        puts 'こんにちは'
    else
        puts 'Hello'
    end
end

greeting
greeting('us')

def default_args(a, b, c = 0, d = 0)
    puts "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end
default_args(1,2)
default_args(1,2,3)
default_args(1,2,3,4)

def foo(time = Time.now,message = bar)
    puts "time: #{time}, message: #{message}"
end

def bar 
    'BAR'
end

foo

#2.11.2
puts ''.empty?
puts 'abc'.empty?

puts 'watch'.include?('at')
puts 'watch'.include?('in')

puts 1.odd?
puts 2.odd?

puts 1.even?
puts 2.even?

puts nil.nil?
puts 'abc'.nil?
puts 1.nil?

def multiple_of_three?(n)
    n % 3 == 0
end

puts multiple_of_three?(4)
puts multiple_of_three?(5)
puts multiple_of_three?(6)

#2.11.3
a = 'ruby'
puts a.upcase
puts a

puts a.upcase!
puts a

def reverse_upcase!(s)
    s.reverse!.upcase!
end

s = 'ruby'
puts reverse_upcase!(s)
puts s

#odd? = 1.odd?
#upcase! = 'ruby'.upcase!

#2.12.2
puts 'hello'.length
puts 'hello'.size
#2.12.3
a = 
    if true
        '真です'
    else
        '偽です'
    end
puts a

b = def foo;end
puts b

#2.12.4
#true = 1

#2.12.5
a = 'hello'
b = 'hello'
puts a.object_id
puts b.object_id

c = b
puts c.object_id

def m(d)
    d.object_id
end
puts m(c)

puts a.equal?(b)
puts b.equal?(c)

a = 'hello'
b = 'hello'
c = b

def m!(d)
    d.upcase!
end

puts m!(c)

puts b
puts c

puts a 

#2.12.7
#Date.today
require 'date'
puts Date.today

puts 123
puts 'abc'

print 123
print 'abc'

p 123
p 'abc'

s = "abc\ndef"
puts s
print s 
p s

puts 'abc'.inspect