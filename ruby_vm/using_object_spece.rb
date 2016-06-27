# ObjectSpace 能访问Ruby VM的堆中的所有的对象
require "objspace" # 增强默认的ObjectSpace的能力

ObjectSpace.trace_object_allocations_start

class MyApp

  def perform
    "foobar"
  end

end

o = MyApp.new.perform

puts ObjectSpace.allocation_sourcefile(o)
puts ObjectSpace.allocation_sourceline(o)
puts ObjectSpace.allocation_generation(o)
puts ObjectSpace.allocation_class_path(o)
puts ObjectSpace.allocation_method_id(o)

# result:
# using_object_spece.rb
# 8
# 6
# MyApp
# perform

# 将内存中的一个对象的信息打印出来
# RVALUE在heap中的大小就是 40 bytes
puts ObjectSpace.dump("abc".freeze) # size: 3 bytes, 但实际分配的空间为 40 bytes
puts ObjectSpace.dump("a"*23) # 分配的空间仍然是 40 bytes
puts ObjectSpace.dump("a"*24) # 分配的空间变成了 65 bytes

puts "打印数组"
puts ObjectSpace.dump([1,2,3])
puts ObjectSpace.dump([1,2,3,4])

# 将内存中所有live object打印到json文件中
GC.start # 如果不打开GC，则很多没有被回收的对象打印出来
ObjectSpace.dump_all(output: File.open('heap.json','w'))

