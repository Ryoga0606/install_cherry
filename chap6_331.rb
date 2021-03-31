#6.1.1
{
  :name => 'Alice',
  :age => 20,
  :gender => :female
}

{
  name: 'Alice',
  age: 20,
  gender: :female
}

old_syntax = <<TEXT
{
  :name => 'Alice',
  :age => 20,
  :gender => :female
}
TEXT

#convert_hash_syntax(old_syntax)

#6.2.1
text = <<TEXT
I love Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

p text.scan(/[A-Z][A-Za-z]+/)

text = <<TEXT
私の郵便場号は1234567です。
僕の住所は6770056 兵庫県西脇市板波町1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4})/,'\1-\2')

#6.3
regex = /\d{3}-\d{4}/
puts regex.class

p '123-4567' =~ /\d{3}-\d{4}/
p 'hello' =~ /\d{3}-\d{4}/

if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end

p /\d{3}-\d{4}/ =~ '123-4567'
p /\d{3}-\d{4}/ =~ 'hello'

p '123-4567' !~ /\d{3}-\d{4}/
p 'hello' !~ /\d{3}-\d{4}/

text = '私の誕生日は1977年7月17日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
p m[1]
p m[2]
p m[3]
p m[0]
if m = /(\d+)年(\d+)月(\d+)日/.match(text)
  #マッチした場合の処理
else
  #マッチしなかった場合の処理
end
p m[2,2]
p m[-1]
p m[1..3]

m = text.match(/(\d+)年(\d+)月(\d+)日/)

#6.3.3
text = '私の誕生日は1977年7月17日です。'
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
p m[:year]
p m[:month]
p m[:day]

p m['year']
p m[2]

if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end

#text = '私の誕生日は1977年7月17日です。'
#if text =~ /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ 
#  puts "#{year}/#{month}/#{day}"
#end

#text = '私の誕生日は1977年7月17日です。'
#regexp = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/
#if regexp =~ text
#  puts "#{year}/#{month}/#{day}"
#end

#6.3.4
p '123 456 789'.scan(/\d+/)

p '1977年7月17日　2016年12月31日'.scan(/(\d+)年(\d+)月(\d+)日/)

p '1977年7月17日　2016年12月31日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)
p '1977年7月17日　2016年12月31日'.scan(/\d+年\d+月\d+日/)

text = '郵便番号は123-4567です'
p text[/\d{3}-\d{4}/]

text = '123-4567 456-7890'
p text[/\d{3}-\d{4}/]

text = '誕生日は1977年7月17日です'
p text[/(\d+)年(\d+)月(\d+)日/]
p text[/(\d+)年(\d+)月(\d+)日/, 3]

text = '誕生日は1977年7月17日です'
p text[/(?<yaer>\d+)年(?<month>\d+)月(?<day>\d+)日/, :day]
p text[/(?<yaer>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'day']

text = '郵便番号は123-4567です'
p text.slice(/\d{3}-\d{4}/)

text = '誕生日は1977年7月17日です'
p text.slice(/(\d+)年(\d+)月(\d+)日/, 3)

text = '郵便番号は123-4567です'
p text.slice!(/\d{3}-\d{4}/)
p text 

text = '123,456-789'
p text.split(',')
p text.split(/,|-/)

text = '123,456-789'
p text.gsub(',',':')
p text.gsub(/,|-/,':')

text = '誕生日は1977年7月17日です'
p text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-\3')

text = '誕生日は1977年7月17日です'
p text.gsub(
  /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/,
  '\k<year>-\k<month>-\k<day>'
)

text = '123,456-789'
hash = { ',' => ':', '-' => '/' }
p text.gsub(/,|-/, hash)

text = '123,456-789'
p text.gsub(/,|-/) { |matched| matched == ',' ? ':' : '/' }

text = '123,456-789'
text.gsub!(/,|-/, ':')
p text

#6.5.1
Regexp.new('\d{3}-\d{4}')
/http:\/\/example\.com/
%r!http://example\.com!
%r{http://example\.com}

pattern = '\d{3}-\d{4}'
p '123-4567' =~ /#{pattern}/

#6.5.2
text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/
  puts '郵便番号です'
when /^d{4}\/\d{1,2}\/\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

#6.5.3
p 'HELLO' =~ /hello/i
p 'HELLO' =~ %r{hello}i

regexp = Regexp.new('hello', Regexp::IGNORECASE)
p 'HELLO' =~ regexp 

p "Hello\nBye" =~ /Hello.Bye/
p "Hello\nBye" =~ /Hello.Bye/m

regex = Regexp.new('Hello.Bye', Regexp::MULTILINE)
p "Hello\nBye" =~ regexp

regexp = /
  \d{3}
  -
  \d{4}
/x
p '123-4567' =~ regexp

regexp = /
  \d{3}
  \ 
  \d{4}
/x
p '123 4567' =~ regexp

pattern = <<'TEXT'
  \d{3}
  -
  \d{4}
TEXT
regexp = Regexp.new(pattern, Regexp::EXTENDED)
p '123-4567' =~ regexp

p "HELLO\nBYE" =~ /Hello.Bye/im
regexp = Regexp.new('Hello.Bye', Regexp::IGNORECASE | Regexp::MULTILINE)
p "HELLO\nBYE" =~ regexp

#6.5.4
text = '私の誕生日は1977年7月17日です。'

text =~ /(\d+)年(\d+)月(\d+)日/
p $~
p $&
p $1
p $2
p $3
p $+

#6.5.5
text = '私の誕生日は1977年7月17日です。'

text =~ /(\d+)年(\d+)月(\d+)日/
p Regexp.last_match
p Regexp.last_match(0)
p Regexp.last_match(1)
p Regexp.last_match(2)
p Regexp.last_match(3)
p Regexp.last_match(-1)

#6.5.6
p /\d{3}-\d{4}/.match?('123-4567')
p $~
p Regexp.last_match
p '123-4567'.match?(/\d{3}-\d{4}/)
