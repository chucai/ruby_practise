# lambda 和 -> 是匿名函数, 相当于函数调用，不会影响调用函数的方法值
# Proc 是 代码片段，所以会直接从方法中返回
def a
  p = lambda { return 'lambda' }
  p.call
  return 'a'
end

def b
  p = Proc.new { return 'proc' }
  p.call
  return 'a'
end

def c
  p = -> () { return '->' }
  p.call
  return 'c'
end

puts a
puts b
puts c
