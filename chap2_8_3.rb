#2.8.3
puts "Line 1,
Line 2"

puts 'Line 1,
Line 2'

a = <<TEXT
これはヒアドキュメントです。
複数行に渡る長い文字列を作成するのに便利です。
TEXT
puts a

<<HTML
<div>
    <img src="sample.jpg">
</div>
HTML

def some_method
    <<-TEXT
これはヒアドキュメントです。
<<-を使うと最後の識別子をインデントさせることができます。
    TEXT
end

puts some_method

def some_method 
    <<~TEXT
        これはヒアドキュメントです。
        <<~を使うと内部文字列のインデント部分が無視されます。
    TEXT
end


name = 'Alice'
a = <<TEXT
ようこそ、#{ name }さん！
以下のメッセージをご覧ください。
TEXT
puts a

a = <<'TEXT'
ようこそ、#{ name }さん!
以下のメッセージをご覧ください。
TEXT
puts a

a = <<"TEXT"
ようこそ、#{ name }さん！
以下のメッセージをご覧ください。
TEXT
puts a

a = 'Ruby'
a.prepend(<<TEXT)
Java
PHP
TEXT
puts a

b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b

puts sprintf('%0.3f',1.2)
puts '%0.3f' % 1.2

puts sprintf('%0.3f + %0.3f',1.2,0.48)
puts '%0.3f + %0.3f' %[1.2,0.48]

puts 123.to_s

puts [10,20,30].join

puts 'Hi!' * 10

puts String.new('hello')

puts "\u3042\u3044\u3046"

puts 'a'
puts 'abc'
puts ''
puts ?a

puts 0b11111111
puts 0377
puts 0xff

puts (~0b1010).to_s(2)
puts (0b1010 & 0b1100).to_s(2)
puts (0b1010 | 0b1100).to_s(2)
puts (0b1010 ^ 0b1100).to_s(2)
puts (0b1010 >> 1).to_s(2)
puts (0b1010 << 1).to_s(2)

puts 2e-3

puts 10.class
puts 1.5.class
puts 999999999999999.class

r = 2 / 3r
puts r
puts r.class

r = '2/3'.to_r
puts r
puts r.class

c = 0.3 - 0.5i
puts c
puts c.class

c = '0.3-0.5i'.to_c
puts c
puts c.class

puts 1 && 2 && 3
puts 1 && nil && 3
puts 1 && false && 3

puts nil || false
puts false || nil
puts nil || false || 2 || 3

#user = find_user('Alice') || find_user('Bob') || find_user('Carol')
#puts user.valid? && send_email_to(user)


#2.10.2
t1 = true 
t2 = true
f1 = false 
puts (t1 and f1)
puts (t1 or f1)
puts (not t1)

puts (!(f1) || t1)
puts (not(f1 || t1))

puts (t1 || t2  && f1)
puts (t1 or t2 and f1)
puts (t1 || (t2 && f1))
puts ((t1 or t2) and f1)


def greeting(country)
    country or return 'countryを入力してください'

    if country == 'japan'
        'こんにちは'
    else
        'hello'
    end
end
puts greeting(nil)
puts greeting('japan')

status = 'error'
if status != 'ok'
    puts '何か異常があります'
end

unless status == 'ok'
    puts '何か異常があります'
end

status = 'ok'
unless status == 'ok'
    puts '何か異常があります'
else
    puts '正常です'
end

status = 'error'
message = 
    unless status == 'ok'
        '何か異常があります'
    else
        '正常です'
    end

puts message

puts '何か異常があります' unless status == 'ok'

status = 'error'
unless status == 'ok' then
    puts '何か異常があります'
end

if status != 'ok'
    puts '何か異常があります'
end

country = 'italy'
if country == 'japan'
    puts 'こんにちは'
elsif country == 'us'
    puts 'Hello'
elsif country == 'italy'
    puts 'ciao'
else 
    puts '???'
end

case country
when 'japan'
    puts 'こんにちは'
when 'us'
    puts 'Hello'
when 'italy'
    puts 'ciao'
else
    puts '???'
end

country = 'アメリカ'
case country 
when 'japan','日本'
    puts 'こんにちは'
when 'us', 'アメリカ'
    puts 'Hello'
when 'italy','イタリア'
    puts 'ciao'
else
    puts '???'
end

country = 'italy'
message = 
    case country
    when 'japan'
        'こんにちは'
    when 'us'
        'Hello'
    when 'italy'
        'ciao'
    else
        '???'
    end

puts message

country = 'italy'

case country
when 'japan' then puts 'こんにちは'
when 'us' then puts 'Hello'
when 'italy' then puts 'ciao'
else puts '???'
end