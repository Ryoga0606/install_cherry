def add(a,b)
    a + b
end
add(1,2)

#メソッド名はスネークケース
def hello_world
    'Hello,world'
end

#キャメルケースは使わない
def helloWorld
    'Hello,world'
end

def _hello_world
    'Hello,world'
end

def hello_world_2
    'Hello,world'
end

#def 2_hello_world
#    'hello,world'
#end

def あいさつする
    'ハローワールド'
end
puts あいさつする

#2.6.1
def add(a,b)
    return a + b
end

#def greeting(country)
#    if country == 'japan'
#        'こんにちは'
#    else
#        'hello'
#    end
#end
#puts greeting('japan')
#puts greeting('us')

def greeting(country)
    return 'countryを入力してください' if country.nil?

    if country == 'japan'
        'こんにちは'
    else
        'hello'
    end
end

puts greeting(nil)
puts greeting('japan')

def greeting
    'こんにちは'
end

def greeting()
    'こんにちは'
end

def greeting country
    if country == 'japan'
        'こんにちは'
    else
        'hello'
    end
end

