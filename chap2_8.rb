irb(main):001:0> 'abc'.class
irb(main):002:0> puts %q!He said, "Don't speak."!
irb(main):003:0> something = 'Hello'
=> "Hello"
irb(main):004:0> puts %Q!He said, "#{ something }"!
He said, "Hello"
=> nil
irb(main):005:0> 
irb(main):006:0> somrthinf = 'Bye'
=> "Bye"
irb(main):007:0> puts %!He said,"#{ something }!
He said,"Hello
=> nil