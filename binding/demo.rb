require 'pry'

class Demo

  def initialize(n)
    @secret = n
  end

  def get_binding
    return binding() # 返回绑定的上下文
  end

  def hello
    puts "world: %d" % @secret
  end
end

k1 = Demo.new 99
b1 = k1.get_binding

k2 = Demo.new -1
b2 = k2.get_binding

puts eval("@secret", b1) # => 99
puts eval("@secret", b2) # => -1
puts eval("@secret") # => nil

puts b1.class # => Binding

puts b1.eval("@secret")  # 在上下文中执行该语句
puts b1.eval("hello")

binding.pry
