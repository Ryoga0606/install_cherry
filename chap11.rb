def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    puts hex 
    hex + n.to_s(16).rjust(2, '0')
  end
end

def greeting(country)
  puts 'greeting start.'
  return 'countryを入力してください' if country.nil?

  if country == 'japan'
    puts 'japan'
    'こんにちは'
  else
    puts 'other'
    'hello'
  end
end

def calc_fare(ticket)
  from = STATIONS.index(ticket.stamped_at)
  to = STATIONS.index(@name)
  distance = p to - from 
  FARES[distance - 1]
end

#11.4.2
a = 'hello'.tap { |s| puts "<<#{s}>>" }
p a 

'#043c78'.scan(/\w\w/).map(&:hex)
'#043c78'.scan(/\w\w/).tap { |rgb| p rgb }.map(&:hex)

#11.4.3
#class User < ApplicationRecord
#  def facebook_username
#    info = facebook_auth.auth_info.info
#    #ログに変数info.name の値を出力する
#    logger.debug "[DEBUG] info.name : #{info.name}"
#    info.name
#  end
#end

#p 'OrderItem'.underscore
#'OrderItem'.method(:underscore).source_location
