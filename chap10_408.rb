#10.2.1
def greeting
  puts 'おはよう'
  puts 'こんばんは'
end
greeting 

greeting do 
  puts 'こんにちは'
end

def greeting
  puts 'おはよう'
  yield
  puts 'こんばんは'
end

greeting do 
  puts 'こんにちは'
end

def greeting 
  puts 'おはよう'
  yield
  yield
  puts 'こんばんは'
end

greeting do 
  puts 'こんにちは'
end

#greeting 

def greeting 
  puts 'おはよう'

  if block_given?
    yield 
  end
  puts 'こんばんは'
end
greeting

greeting do 
  puts 'こんにちは'
end

def greeting 
  puts 'おはよう'
  text = yield 'こんにちは'
  puts text 
  puts 'こんばんは'
end

greeting do |text|
  text * 2 
end

def greeting 
  puts 'おはよう'
  text = yield 'こんにちは', 12345
  puts text 
  puts 'こんばんは'
end

greeting do |text|
  text * 2 
end

def greeting 
  puts 'おはよう'
  text = yield 'こんにちは'
  puts text 
  puts 'こんばんは'
end

greeting do |text, other|
  text * 2 + other.inspect 
end

#10.2.2
def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text 
  puts 'こんばんは'
end

greeting do |text|
  text * 2 
end

def greeting(&block)
  puts 'おはよう'
  unless block.nil?
    text = block.call('こんにちは')
    puts text 
  end
  puts 'こんばんは'
end

greeting 

greeting do |text|
  text * 2 
end

def greeting(&block)
  puts 'おはよう'
  if block_given?
    text = yield 'こんにちは'
    puts text 
  end
  puts 'こんばんは'
end

def greeting_ja(&block)
  texts = ['おはよう','こんにちは', 'こんばんは']
  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  greeting_common(texts, &block)
end

def greeting_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
  puts texts[2]
end

greeting_ja do |text|
  text * 2 
end

greeting_en do |text|
  text.upcase
end

def greeting(&block)
  puts 'おはよう'
  text = 
    if block.arity == 1 
      yield 'こんにちは'
    elsif block.arity == 2 
      yield 'こんに','ちは'
    end
  puts text
  puts 'こんばんは'
end

greeting do |text|
  text * 2 
end

greeting do |text_1, text_2|
  text_1 * 2 + text_2 * 2
end

#10.3.1
hello_proc = Proc.new do 
  'Hello'
end

hello_proc = Proc.new { 'Hello' }
p hello_proc.call

add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20)

add_proc = Proc.new {|a = 0, b = 0| p  a + b }
add_proc.call
add_proc.call(10)
add_proc.call(10,20)

add_proc = proc { |a, b| p a + b }

#10.3.2
def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text 
  puts 'こんばんは'
end

def greeting(&block)
  puts block.class 

  puts 'おはよう'
  text = block.call('こんにちは')
  puts text 
  puts 'こんばんは'
end

greeting do |text|
  text * 2 
end

def greeting(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text 
  puts 'こんばんは'
end

repeat_proc = Proc.new { |text| text * 2 }
greeting(&repeat_proc)

#10.3.3
def greeting(arrange_proc)
  puts 'おはよう'
  text = arrange_proc.call('こんにちは')
  puts text 
  puts 'こんばんは'
end

repeat_proc = Proc.new{|text| text * 2 }
greeting(repeat_proc)

def greeting(proc_1, proc_2, proc_3)
  puts proc_1.call('おはよう')
  puts proc_2.call('こんにちは')
  puts proc_3.call('こんばんは')
end

shuffle_proc = Proc.new { |text| text.chars.shuffle.join }
repeat_proc = Proc.new { |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?"}
greeting(shuffle_proc, repeat_proc, question_proc)

#10.3.4
Proc.new { |a, b| a + b }
proc { |a, b| a + b }
->(a,b) { a + b }
lambda { |a, b| a + b }

->a, b { a + b }
-> {a + b }
->(a, b) {
  a + b 
}
->(a, b) do 
  a + b 
end

->(a = 0, b = 0) { a + b }

add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20)

add_lamda = ->(a, b) {a + b}
p add_lamda.call(10, 20)

add_proc = Proc.new { |a, b| a.to_i + b.to_i }
p add_proc.call(10)
p add_proc.call(10, 20, 100)

add_lamda = ->(a, b) {a.to_i + b.to_i }
#p add_lamda.call(10)
#p add_lamda.call(10 ,20 ,30)

#10.3.5
add_proc = Proc.new{ |a, b| a + b }
p add_proc.class 
p add_proc.lambda?

add_lambda = ->(a, b){ a + b }
p add_lambda.class 
p add_lambda.lambda?

def self.loud(level)
  ->(words) do
    words.split(' ').map { |word| word.upcase + '!' * level }.join(' ')
  end
end

def self.loud(level)
  ->(words) do 
    words 
    .split(' ')
    .map { |word| word.upcase + '!' * level }
    .join(' ')
  end
end

#10.5.1
add_proc = Proc.new { |a, b| a + b }
p add_proc.call(10, 20)
p add_proc.yield(10, 20)
p add_proc.(10, 20)
p add_proc[10, 20]
add_proc === [10, 20]

def judge(age)
  adult = Proc.new{ |n| n > 20 }
  child = Proc.new{ |n| n < 20 }

  case age 
  when adult 
    '大人です'
  when child 
    '子どもです'
  else
    'はたちです'
  end
end

p judge(25)
p judge(18)
p judge(20)

#10.5.2
reverse_proc = Proc.new { |s| s.reverse }
p ['Ruby', 'Java', 'Perl'].map(&reverse_proc)
reverse_proc = Proc.new { |s| s.reverse }
other_proc = reverse_proc.to_proc 
p reverse_proc.equal?(other_proc)

split_proc = :split.to_proc
p split_proc
p split_proc.call('a-b-c-d e')
p split_proc.call('a-b-c-d e', '-')
p split_proc.call('a-b-c-d e', '-', 3)

p ['ruby', 'java', 'perl'].map { |s| s.upcase }
p ['ruby', 'java', 'perl'].map(&:upcase)

#10.5.3
def generate_proc(array)
  counter = 0 
  Proc.new do 
    counter += 10 
    array << counter 
  end
end
values = []
sample_proc = generate_proc(values)
p values
sample_proc.call
p values 
sample_proc.call
p values

#10.5.4
def proc_return
  # Proc.new でreturn　を使う
  f = Proc.new { |n| return n * 10 }
  ret = [1, 2, 3].map(&f)
  "ret: #{ret}"
end

def lambda_return
  #ラムダでreturnを使う
  f = ->(n) { return n * 10 }
  ret = [1, 2, 3].map(&f)
  "ret: #{ret}"
end

p proc_return
p lambda_return

def proc_break
  f = Proc.new { |n| break n * 10 }
  ret = [1, 2, 3].map(&f)
  "ret: #{ret}"
end

def lambda_break
  f = ->(n) { break n * 10 }
  ret = [1, 2, 3].map(&f)
  "ret: #{ret}"
end

#p proc_break
p lambda_break
