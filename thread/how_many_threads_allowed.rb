# 计算出 该机器默认运行的thread数量
n = 1
while true
  Thread.new {
    sleep 10
    puts n
  }
  n += 1
  puts n
end
