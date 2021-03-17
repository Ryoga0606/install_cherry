#2.2.1
puts '2.2.1'
puts '1'.to_s
puts 1.to_s
puts nil.to_s
puts true.to_s
puts false.to_s
puts /\d+/.to_s

#2.2.2
puts '2.2.2'
puts 1.to_s()
puts 1.to_s
puts 10.to_s(16)
puts 10.to_s 16

#2.2.3
puts '2.2.3'
puts 1.to_s
puts nil.to_s
puts 10.to_s(16)
puts 1.to_s;puts nil.to_s;puts 10.to_s(16)

puts 10.to_s(
    16
)

#2.3.1
puts "こんにちは\nさようなら"
puts 'こんにちは\nさようなら'

name = 'Alice'
puts "Hello,#{ name }!"
i = 10
puts "#{ i }は16進数にすると#{ i.to_s(16) }です"

name = 'John'
puts 'Hello.#{ name }'
puts "こんにちは\\nさようなら"
name = 'Alice'
puts 'Hello,' + name + '!'

puts "Hello,\"{ name }"

puts 'He said, "Don\'t speak."'
puts "He said, \"Don't speak.\""