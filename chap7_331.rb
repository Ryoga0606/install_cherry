users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }

users.each do |user|
  puts "氏名: #{user[:first_name]} #{user[:last_name]}、年齢: #{user[:age]}"
end

def full_name(user)
  "#{user[:first_name]} #{user[:last_name]}"
end

users.each do |user|
  puts "氏名: #{full_name(user)}、年齢: #{user[:age]}"
end

users[0][:first_name]
users[0][:first_mame]

users[0][:country] = 'japan'
users[0][:first_name] = 'Carol'
p users[0]
