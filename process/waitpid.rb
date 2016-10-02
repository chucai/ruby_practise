# Process.waitpid 会阻塞主进程的运行
puts "parent: %d" % Process.pid
pid = fork do
  puts "fork: %d" % Process.pid
  sleep 5
end

Process.waitpid pid

puts "after waitpid"
