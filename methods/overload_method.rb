# ruby是不支持函数重载的
def a(x,y)
  puts __method__
end

def a(x, y, z)
  puts "a(x, y, z)"
  puts __method__
end

#a(1, 2) # 会报错
a(1, 2, 3)
