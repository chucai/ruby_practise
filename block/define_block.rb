# block 中的运行环境是定义的时候决定的
# 也就是说 block 会携带定义时的上下文
x = 1

block = lambda do |i|
  puts "call define block"
  puts self
  puts "x is %d" % x
  puts "i is %d" % i
end

class A

  def method_a(&block)
    x = 2
    block.call(x)
  end
end

A.new.method_a(&block)

# Results:
#call define block
#main
#x is 1
#i is 2
