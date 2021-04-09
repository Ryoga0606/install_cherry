module Greeter 
  def hello 
    'hello'
  end
end

#greeter = Greeter.new
puts 'End.'

#9.2.2
puts 'Start.'
module Greeter 
  def hello 
    'hello'
  end
end

begin 
  greeter = Greeter.new 
rescue
  puts '例外が発生したが、このまま続行する'
end

puts 'End.'

#9.2.3
def method_1 
  puts 'method_1 start.'
#  method_2
  begin
    method_2 
  rescue 
    puts '例外が発生しました'
  end
  puts 'method_1 end.'
end

def method_2 
  puts 'method_2 start.'
  method_3 
  puts 'method_2 end.'
end

def method_3 
  puts 'method_3 start.'
  1 / 0 
  puts 'method_3 end.'
end

method_1

#9.4.2
begin 
  1 / 0 
rescue => e 
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース　-----"
  puts e.backtrace 
  puts "-----"
end

#9.2.5
begin 
  1 / 0 
rescue ZeroDivisionError
  puts "0で除算しました"
end

begin 
  'abc'.foo
rescue ZeroDivisionError
  puts '0で除算しました'
rescue NoMethodError 
  puts "存在しないメソッドが呼び出されました"
end

begin 
  'abc'.foo
rescue ZeroDivisionError, NoMethodError
  puts "0で除算したか、存在しないメソッドが呼び出されました"
end

begin 
  'abc'.foo 
rescue ZeroDivisionError, NoMethodError => e 
  puts "0で除算したか、存在しないメソッドが呼び出されました"
  puts "エラー: #{e.class} #{e.message}"
end

#9.2.6
begin 
  #例外が起きそうな処理
rescue
  #StandardError とそのサブクラスのみ捕捉される
end

begin 
  #例外が起きそうな処理
rescue Exception
  #Exception とそのサブクラスが捕捉される。つまりNoMemoryError　や SystemExit まで捕捉される
end

#9.2.7
begin 
  #NoMethodError を発生させる
  'abc'.foo 
rescue NameError 
  # NoMethodError はここで捕捉される
  puts 'NameErrorです'
rescue NoMethodError
  #このrescue 節は永遠に実行されない
  puts 'NoMethodErrorです'
end

begin 
  'abc'.foo
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

begin 
  Foo.foo
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

begin 
  1 / 0 
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue StandardError
  puts 'その他のエラーです'
end

begin 
  1 / 0 
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue 
  puts 'その他のエラーです'
end

#9.2.8
retry_count = 0 
begin 
  puts '処理を開始します'
  1 / 0 
rescue 
  retry_count += 1 
  if retry_count <= 3 
    puts "retryします。(#{retry_count}回目)"
    retry
  else 
    puts 'retryに失敗しました。'
  end
end

#9.3
def currency_of(country)
  case country 
  when :japan
    'yen'
  when :us 
    'dollar'
  when :india 
    'rupee'
  else 
    raise ArgumentError.new("無効な国名です。#{country}")
  end
end
p currency_of(:japan)
#p currency_of(:italy)

#users.each do |user|
#  begin 
#    send_mail_to(user)
#  rescue => e 
#    puts "#{e.class}: #{e.message}"
#    puts e.backtrace
#  end
#end

#9.4.3
require 'date'
def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988 
    month = m[:month].to_i 
    day = m[:day].to_i 
  begin
    Date.new(year, month, day)
  rescue ArgumentError
    nil 
  end
end

p convert_heisei_to_date('平成28年12月31日')
p convert_heisei_to_date('平成28年99月99日')

#9.4.4
require 'date'
def convert_heisei_to_date(heisei_text)
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
    year = m[:jp_year].to_i + 1988 
    month = m[:month].to_i 
    day = m[:day].to_i 
  
    if Date.valid_date?(year, month, day)
      Date.new(year, month, day)
  end
end

p convert_heisei_to_date('平成28年12月31日')
p convert_heisei_to_date('平成28年99月99日')

#9.4.5
def currency_of(country)
  case country 
  when :japan
    'yen'
  when :us 
    'dollar'
  when :india
    'rupee'
  end
end
p currency_of(:italy)
currency = currency_of(:italy)
#p currency.upcase

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  else
    'rupee'
  end
end

p currency_of(:italy)

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise ArgumentError, "無効な国名です。#{country}"
  end
end

#p currency_of(:italy)
#9.5.3
#input = gets
#input = input.chomp
#p input
#
#input = gets.chomp
#p input

#9.6.1
file = File.open('some.txt', 'w')
begin 
  file << 'Hello'
ensure
  file.close
end

File.open('some.txt', 'w') do |file|
  file << 'Hello'
end

#File.open('some.txt', 'w') do |file|
#  file << 'Hello'
#  1 / 0 
#end

#9.6.3
begin
rescue
else
ensure
end

begin
  puts 'Hello'
rescue 
  puts '例外が発生しました。'
else
  puts '例外が発生しませんでした。'
end

begin 
  puts 'Hello.'
  puts '例外は発生しませんでした。'
rescue
  puts '例外が発生しました。'
end

#9.6.4
ret = 
  begin
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
p ret

ret = 
  begin 
    1 / 0
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end

p ret 

def some_method(n)
  begin
    1 / n 
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
end

p some_method(1)
p some_method(0)

def some_method(n)
  begin 
    1 / n 
    'OK'
  rescue
    'error'
  ensure
    return 'ensure'
  end
end
p some_method(1)
p some_method(0)

def some_method(n)
  begin 
    1 / 0 
    'OK'
  ensure
    return 'ensure' #ensure でreturn は使わない
  end
end

p some_method(1)
p some_method(0)

#9.6.5
p 1 / 1 rescue 0 
p 1 / 0 rescue 0 

require 'date'

def to_date(string)
  begin 
    Date.parse(string)
  rescue ArgumentError
    nil 
  end
end

p to_date('2017-01-01')
p to_date('abcdef')

def to_date(string)
  Date.parse(string) rescue nil 
end

p to_date('2017-01-01')
p to_date('abcdef')

begin 
  1 / 0 
rescue => e 
  puts "#{e.class} #{e.message}"
  puts e.backtrace
end

begin 
  1 / 0
rescue
  puts "#{$!.class} #{$!.message}"
  puts $@
end

#9.6.7
def fizz_buzz(n)
  begin
    if n % 15 == 0 
      'Fizz Buzz'
    elsif n % 3 == 0 
      'Fizz'
    elsif n % 5 == 0 
      'Buzz'
    else 
      n.to_s
    end
  rescue => e 
    puts "#{e.class} #{e.message}"
  end
end
p fizz_buzz(nil)

def fizz_buzz(n)
    if n % 15 == 0 
      'Fizz Buzz'
    elsif n % 3 == 0 
      'Fizz'
    elsif n % 5 == 0 
      'Buzz'
    else 
      n.to_s
    end
  rescue => e 
    puts "#{e.class} #{e.message}"
end
p fizz_buzz(nil)

#def some_method
#  1 / 0 
#rescue => e 
#  puts "エラーが発生しました: #{e.mesage}"
#  puts e.backtrace
#end
#
#begin 
#  some_method
#rescue => e 
#  puts "エラーが発生しました: #{e.mesage}"
#  puts e.backtrace
#  original = e.cause
#  unless original.nil?
#    puts "元の例外: #{original.class} #{original.message}"
#    puts original.backtrace
#  end
#end

#9.6.8
#def fizz_buzz(n)
#  if n % 15 == 0 
#    'Fizz Buzz'
#  elsif n % 3 == 0 
#    'Fizz'
#  elsif n % 5 == 0 
#    'Buzz'
#  else
#    n.to_s
#  end
#rescue => e 
#  puts "[LOG] エラーが発生しました: #{e.class} #{e.message}"
#  raise
#end
#
#p fizz_buzz(nil)

#9.6.9
#class NoCountryError < StandardError
#end
#
#def currency_of(country)
#  case country
#  when :japan
#    'yen'
#  when :us 
#    'dollar'
#  when :india 
#    'rupee'
#  else 
#    raise NoCountryError, "無効な国名です。#{country}"
#  end
#end
#
#p currency_of(:italy)

class NoCountryError < StandardError
  attr_reader :country

  def initialize(message, country)
    @country = country 
    super("#{message} #{country}")
  end
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else 
    raise NoCountryError.new('無効な国名です。', country)
  end
end

begin 
  currency_of(:italy)
rescue NoCountryError => e 
  puts e.message
  puts e.country 
end


